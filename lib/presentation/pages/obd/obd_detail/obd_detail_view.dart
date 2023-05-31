import 'dart:async';
import 'dart:io' as io;
import 'dart:isolate';
import 'dart:math';

import 'package:baseproject/app_constant.dart';
import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_state.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_view_model.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/widget/camera_view.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/widget/object_detector_painter.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:path/path.dart' as mypath;
import 'package:path_provider/path_provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:telephony/telephony.dart';

import '../../../../ultilities/flutter_tts.dart';

BluetoothConnection? connection;
Timer? timer;
Telephony? telephony;

final _provider =
    StateNotifierProvider.autoDispose<ObdDetailViewModel, ObdDetailState>(
        (ref) => ObdDetailViewModel());

class ObdDetailArgument {
  String address;

  ObdDetailArgument(this.address);
}

class ObdDetailView extends ConsumerStatefulWidget {
  const ObdDetailView(this.obdDetailArgument, {super.key});

  final ObdDetailArgument obdDetailArgument;

  @override
  ConsumerState<ObdDetailView> createState() => _ObdDetailView();
}

class _ObdDetailView extends ConsumerState<ObdDetailView> {
  late ObjectDetector _objectDetector;
  bool _canProcess = false;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  ReceivePort receivePort = ReceivePort();
  SpeechToText speechToText = SpeechToText();
  String mytext = '';
  bool listenToUser = false;

  ObdDetailViewModel get viewModel => ref.read(_provider.notifier);

  ObdDetailState get state => ref.watch(_provider);
  final FlutterTextToSpeech flutterTextToSpeech = FlutterTextToSpeech();

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero,()async{
    //   SystemChrome.setPreferredOrientations([
    //     DeviceOrientation.landscapeRight,
    //     DeviceOrientation.landscapeLeft,
    //   ]);
    // });
    Future.delayed(Duration.zero, () async {
      telephony = Telephony.instance;
      await flutterTextToSpeech.initial();
      bool? permissionsGranted = await telephony?.requestPhoneAndSmsPermissions;
      final avalable = await speechToText.initialize();
      if (avalable) {
        speechToText.listen(
          onResult: (result) {
            setState(() {
              mytext = result.recognizedWords;
            });
          },
        );
      }
      if (permissionsGranted == true) {
        telephony?.listenIncomingSms(
            onNewMessage: (message) async {
              if (speechToText.isNotListening) {
                print('waoooo');
              }
              flutterTextToSpeech
                  .speak(
                      'you have message from ${message.address} with content: ${message.body}')
                  .then((_) async {
                await Future.delayed(Duration(seconds: 3));
                listenToUser = true;
                speechToText.listen(
                  onResult: (result) {
                    setState(() {
                      mytext = result.recognizedWords;
                    });
                  },
                );
              });
            },
            listenInBackground: false);
      } else {
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Permission'),
              content:
                  const Text('Please access the permission for safe drive'),
              actions: [
                TextButton(
                    onPressed: () async {
                      await telephony?.requestPhoneAndSmsPermissions;
                    },
                    child: const Text('Access')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'))
              ],
            ),
          );
        }
      }
    });
    _initializeDetector(DetectionMode.stream);
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      viewModel.updateSpeed(Random().nextInt(10) * 1.0);
      print('listening: ${speechToText.isNotListening} and $listenToUser');
      if (speechToText.isNotListening && listenToUser) {
        listenToUser = false;
        print('khong listen');
      }
    });
    // Future.delayed(Duration.zero, () async {
    //   connection =
    //       await BluetoothConnection.toAddress(widget.obdDetailArgument.address);
    //   timer = Timer.periodic(const Duration(milliseconds: 1500), (timer) async {
    //     // sendPort.send('hello $timer');
    //     connection?.output.add(Uint8List.fromList(utf8.encode("010d\r\n")));
    //     await Future.delayed(const Duration(milliseconds: 300));
    //     connection?.output.add(Uint8List.fromList(utf8.encode("010c\r\n")));
    //     await Future.delayed(const Duration(milliseconds: 300));
    //     connection?.output.add(Uint8List.fromList(utf8.encode("0105\r\n")));
    //     await Future.delayed(const Duration(milliseconds: 300));
    //     // connection?.output
    //     //     .add(Uint8List.fromList(utf8.encode("015e\r\n")));
    //
    //     await connection?.output.allSent;
    //   });
    //
    //   connection?.input?.listen((event) {
    //     String string = String.fromCharCodes(event);
    //     print(string);
    //     List<String> speedL = string.split(' ');
    //     if (string.length > 3 && speedL.length>2) {
    //       if (speedL[1] == '0D') {
    //         viewModel.updateSpeed(int.parse(speedL[2], radix: 16) * 1.0);
    //       } else if (speedL[1] == '0C') {
    //         viewModel.updateRmp(((int.parse(speedL[2], radix: 16) * 256) +
    //                 int.parse(speedL[3], radix: 16)) /
    //             100);
    //       } else if (speedL[1] == '05') {
    //         viewModel.updatemucnhienlieu(int.parse(speedL[2], radix: 16) * 1.0);
    //       }
    //     }
    //   });
    // });
  }

  @override
  void dispose() {
    _canProcess = false;
    _objectDetector.close();
    connection?.dispose();
    timer?.cancel();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          listenToUser = true;
          speechToText.listen(
            onResult: (result) {
              setState(() {
                listenToUser = true;
                mytext = result.recognizedWords;
              });
            },
          );
        },
        child: Text('pick'),
      ),
      body: SafeArea(
        child: Column(
          children: [Text(mytext), Text(state.speed.toString())],
        ),
      ),
    )
        //   CameraView(
        //   title: 'Object Detector',
        //   customPaint: _customPaint,
        //   text: _text,
        //   onImage: (inputImage) {
        //     processImage(inputImage);
        //   },
        //   onScreenModeChanged: _onScreenModeChanged,
        //   initialDirection: CameraLensDirection.back,
        // )
        ;
  }

  void _onScreenModeChanged(ScreenMode mode) {
    switch (mode) {
      case ScreenMode.gallery:
        _initializeDetector(DetectionMode.single);
        return;

      case ScreenMode.liveFeed:
        _initializeDetector(DetectionMode.stream);
        return;
    }
  }

  void _initializeDetector(DetectionMode mode) async {
    const path = 'assets/tfl/object_labeler.tflite';
    final modelPath = await _getModel(path);
    final options = LocalObjectDetectorOptions(
        mode: mode,
        modelPath: modelPath,
        classifyObjects: true,
        multipleObjects: true,
        maximumLabelsPerObject: 2);
    _objectDetector = ObjectDetector(options: options);
    _canProcess = true;
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final objects = await _objectDetector.processImage(inputImage);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = ObjectDetectorPainter(
          objects,
          inputImage.inputImageData!.imageRotation,
          inputImage.inputImageData!.size);
      _customPaint = CustomPaint(painter: painter);
    } else {
      String text = 'Objects found: ${objects.length}\n\n';
      for (final object in objects) {
        text +=
            'Object:  trackingId: ${object.trackingId} - ${object.labels.map((e) => e.text)}\n\n';
      }
      _text = text;
      // TODO: set _customPaint to draw boundingRect on top of image
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<String> _getModel(String assetPath) async {
    if (io.Platform.isAndroid) {
      return 'flutter_assets/$assetPath';
    }
    final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
    await io.Directory(mypath.dirname(path)).create(recursive: true);
    final file = io.File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }
}
