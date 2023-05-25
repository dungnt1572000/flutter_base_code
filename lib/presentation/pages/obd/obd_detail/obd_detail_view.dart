import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;
import 'dart:isolate';

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
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

BluetoothConnection? connection;
Timer? timer;

final _provider = StateNotifierProvider<ObdDetailViewModel, ObdDetailState>(
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

  ObdDetailViewModel get viewModel => ref.read(_provider.notifier);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      // SystemChrome.setPreferredOrientations([
      //   DeviceOrientation.landscapeRight,
      //   DeviceOrientation.landscapeLeft,
      // ]);
    });
    _initializeDetector(DetectionMode.single);
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

  XFile? image;

  @override
  void dispose() {
    _canProcess = false;
    _objectDetector.close();
    connection?.dispose();
    timer?.cancel();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  void createIsolateForBluetooth() {
    var receivePort = ReceivePort();
    Isolate.spawn(connectBluetooth, receivePort.sendPort);
    receivePort.listen((message) {
      print('Day la receivePort: $message');
    });
  }

  static void connectBluetooth(SendPort sendPort) {
    sendPort.send('hello em');
    // timer = Timer.periodic(const Duration(milliseconds: 1500), (timer) async {
    //   // sendPort.send('hello $timer');
    //   connection?.output.add(Uint8List.fromList(utf8.encode("010d\r\n")));
    //   await Future.delayed(const Duration(milliseconds: 300));
    //   connection?.output.add(Uint8List.fromList(utf8.encode("010c\r\n")));
    //   await Future.delayed(const Duration(milliseconds: 300));
    //   connection?.output.add(Uint8List.fromList(utf8.encode("0105\r\n")));
    //   await Future.delayed(const Duration(milliseconds: 300));
    //   // connection?.output
    //   //     .add(Uint8List.fromList(utf8.encode("015e\r\n")));
    //
    //   await connection?.output.allSent;
    // });
    // connection?.input?.listen((event) {
    //   String string = String.fromCharCodes(event);
    //   print(string);
    //   if (string.length > 3) {
    //     sendPort.send(string);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: TextButton(
        child: Text('pick'),
        onPressed: () async {
          image = await ImagePicker().pickImage(source: ImageSource.gallery);
          final path = image?.path;
          if (path == null) {
            return;
          }
          final inputImage = InputImage.fromFilePath(path);
         await processImage(inputImage);
         setState(() {

         });
        },
      ),
      body: Stack(
        children: [
          image == null ? SizedBox() : Image.file(io.File(image!.path)),
          if (_customPaint != null) _customPaint!,
        ],
      )
      // CameraView(
      //   title: 'Object Detector',
      //   customPaint: _customPaint,
      //   text: _text,
      //   onImage: (inputImage) {
      //     processImage(inputImage);
      //   },
      //   onScreenModeChanged: _onScreenModeChanged,
      //   initialDirection: CameraLensDirection.back,
      // )
      ,
    );
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
    print('Set detector in mode: $mode');

    // uncomment next lines if you want to use the default model
    // final options = ObjectDetectorOptions(
    //     mode: mode,
    //     classifyObjects: true,
    //     multipleObjects: true);
    // _objectDetector = ObjectDetector(options: options);

    // uncomment next lines if you want to use a local model
    // make sure to add tflite model to assets/ml
    const path = 'assets/tfl/object_labeler.tflite';
    final modelPath = await _getModel(path);
    final options = LocalObjectDetectorOptions(
        mode: mode,
        modelPath: modelPath,
        classifyObjects: true,
        multipleObjects: true,
        maximumLabelsPerObject: 2);
    _objectDetector = ObjectDetector(options: options);

    // uncomment next lines if you want to use a remote model
    // make sure to add model to firebase
    // final modelName = 'bird-classifier';
    // final response =
    //     await FirebaseObjectDetectorModelManager().downloadModel(modelName);
    // print('Downloaded: $response');
    // final options = FirebaseObjectDetectorOptions(
    //   mode: mode,
    //   modelName: modelName,
    //   classifyObjects: true,
    //   multipleObjects: true,
    // );
    // _objectDetector = ObjectDetector(options: options);

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

      final painter = ObjectDetectorPainter(
          objects,
          InputImageRotation.rotation0deg,
          image.);
      _customPaint = CustomPaint(painter: painter);

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
    await io.Directory(dirname(path)).create(recursive: true);
    final file = io.File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }
}
