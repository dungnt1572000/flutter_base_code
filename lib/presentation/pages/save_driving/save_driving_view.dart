import 'package:baseproject/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tflite/tflite.dart';

class SaveDrivingView extends ConsumerStatefulWidget {
  const SaveDrivingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SaveDrivingViewState();
}

class _SaveDrivingViewState extends ConsumerState<SaveDrivingView> {
  late CameraController controller;
  String output = '';
  CameraImage? cameraImage;
  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      controller.startImageStream((image) {
        cameraImage = image;
        runModel();
      });
      loadModel();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  Future runModel() async {
    if (cameraImage != null) {
      var prediction = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((e) {
            return e.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5, // defaults to 127.5
          imageStd: 127.5, // defaults to 127.5
          rotation: 90, // defaults to 90, Android only
          numResults: 2, // defaults to 5
          threshold: 0.1, // defaults to 0.1
          asynch: true);
      for (var element in prediction!) {
        setState(() {
          output = element['label'];
        });
      }
    }
  }

  Future loadModel() async {
    await Tflite.loadModel(
        model: 'assets/tfl/model_50km.tflite', labels: 'assets/tfl/labels.txt');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: size.height * 0.8,
              width: size.width,
              child: CameraPreview(controller)),
          Text('$output'),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    Tflite.close();
    super.dispose();
  }
}
