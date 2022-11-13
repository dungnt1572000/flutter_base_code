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
  int _imageCount = 0;

  Future<String> loadModel() async {
    output = await Tflite.loadModel(
          model: "assets/tfl/model_unquant.tflite",
          labels: "assets/tfl/labels.txt",
          isAsset: true,
          numThreads: 1,
          useGpuDelegate: false,
        ) ??
        'cant relize';
    return output;
  }

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.high);
    Future.delayed(Duration.zero, () async {
      await loadModel();
    });
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      controller.startImageStream((img) async {
        _imageCount++;
        if (_imageCount % 10 == 0) {
          var recognitions = await Tflite.runModelOnFrame(
              bytesList: img.planes.map((plane) {
                return plane.bytes;
              }).toList(), // required
              imageHeight: img.height,
              imageWidth: img.width,
              imageMean: 127.5, // defaults to 127.5
              imageStd: 127.5, // defaults to 127.5
              rotation: 90, // defaults to 90, Android only
              numResults: 2, // defaults to 5
              threshold: 0.1, // defaults to 0.1
              asynch: true // defaults to true
              );
          if (recognitions != null) {
            if (recognitions[0]['confidence'] > 0.7) {
              setState(() {
                output = recognitions[0]['label'];
              });
            } else {
              setState(() {
                output = 'Unknown';
              });
            }
          }
        }
      });
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: size.height * 0.8,
              width: size.width,
              child: CameraPreview(controller)),
          Text(output),
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
