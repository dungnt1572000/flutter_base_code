import 'dart:async';
import 'dart:io' as io;
import 'dart:isolate';
import 'dart:math';

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
  String text = '';
  String mytalk = '';
  String phoneNumber = '';
  BluetoothConnection? connection;
  Timer? timer;
  Telephony telephony = Telephony.instance;
  final speechToText = SpeechToText();
  bool liseningUser = false;

  ObdDetailViewModel get viewModel => ref.read(_provider.notifier);

  ObdDetailState get state => ref.watch(_provider);

  final FlutterTextToSpeech flutterTextToSpeech = FlutterTextToSpeech();

  Future<void> initPlatformState() async {
    final bool? result = await telephony.requestPhoneAndSmsPermissions;
    if (result != null && result) {
      telephony.listenIncomingSms(
          onNewMessage: (message) {
            Timer(Duration(milliseconds: 500), () async {
              await flutterTextToSpeech
                  .speak('${message.address} send content: ${message.body}');
              phoneNumber = message.address ?? '';
              await Future.delayed(Duration(seconds: 4), () async {
                await flutterTextToSpeech
                    .speak('You start with Reply for reply message');

                final abc = await speechToText.initialize();
                if (abc) {
                  speechToText.listen(
                    onResult: (result) {
                      mytalk = result.recognizedWords;
                    },
                  );
                  liseningUser = true;
                } else {
                  print('deo on roi');
                }
              });
            });
          },
          listenInBackground: false);
    }

    if (!mounted) return;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await flutterTextToSpeech.initial();
      await initPlatformState();
    });
    _initializeDetector(DetectionMode.stream);
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) async {
      setState(() {
        text = Random().nextInt(10).toString();
      });
      print('${speechToText.isNotListening}&& $liseningUser');
      if (speechToText.isNotListening && liseningUser) {
        liseningUser = false;
        print(mytalk);
        print('day la phone: $phoneNumber');
        if (!mytalk.contains('reply')) {
          flutterTextToSpeech.speak('you start with reply for reply message');
        } else {
          mytalk = mytalk.substring(mytalk.indexOf('reply') + 5);
          flutterTextToSpeech.speak(mytalk);

            telephony.sendSms(to: phoneNumber, message: mytalk);

        }
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
        onPressed: () async {},
        child: Text('pick'),
      ),
      body: Container(
        child: Text(text),
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

  // Future<void> processImage(InputImage inputImage) async {
  //   if (!_canProcess) return;
  //   if (_isBusy) return;
  //   _isBusy = true;
  //   setState(() {
  //     _text = '';
  //   });
  //   final objects = await _objectDetector.processImage(inputImage);
  //   if (inputImage.inputImageData?.size != null &&
  //       inputImage.inputImageData?.imageRotation != null) {
  //     final painter = ObjectDetectorPainter(
  //         objects,
  //         inputImage.inputImageData!.imageRotation,
  //         inputImage.inputImageData!.size);
  //     _customPaint = CustomPaint(painter: painter);
  //   } else {
  //     String text = 'Objects found: ${objects.length}\n\n';
  //     for (final object in objects) {
  //       text +=
  //           'Object:  trackingId: ${object.trackingId} - ${object.labels.map((e) => e.text)}\n\n';
  //     }
  //     _text = text;
  //     // TODO: set _customPaint to draw boundingRect on top of image
  //     _customPaint = null;
  //   }
  //   _isBusy = false;
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

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
