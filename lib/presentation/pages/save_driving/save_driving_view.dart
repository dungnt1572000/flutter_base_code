import 'package:baseproject/main.dart';
import 'package:baseproject/presentation/pages/home/home_view.dart';
import 'package:baseproject/presentation/pages/save_driving/save_driving_state.dart';
import 'package:baseproject/presentation/pages/save_driving/save_driving_view_model.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:tflite/tflite.dart';

final provider =
    StateNotifierProvider.autoDispose<SaveDrivingViewModel, SaveDrivingState>(
  (ref) => SaveDrivingViewModel(),
);

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
  SaveDrivingState get _state => ref.read(provider);
  SaveDrivingViewModel get _viewModel => ref.read(provider.notifier);

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
      // setState(() {});
      controller.startImageStream((img) async {
        _imageCount++;
        if (_imageCount % 10 == 0) {
          // print(output);
          // var recognitions = await Tflite.detectObjectOnFrame(
          //     bytesList: img.planes.map((plane) {
          //       return plane.bytes;
          //     }).toList(), // required
          //     model: "SSDMobileNet",
          //     imageHeight: img.height,
          //     imageWidth: img.width,
          //     imageMean: 127.5, // defaults to 127.5
          //     imageStd: 127.5, // defaults to 127.5
          //     rotation: 90, // defaults to 90, Android only     // defaults to 5
          //     threshold: 0.1, // defaults to 0.1
          //     asynch: true // defaults to true
          //     );

          var recognitions = await Tflite.runModelOnFrame(
              bytesList: img.planes.map((plane) {
                return plane.bytes;
              }).toList(),
              imageHeight: img.height,
              imageWidth: img.width,
              numResults: 5);
          if (recognitions != null) {
            if (recognitions.isNotEmpty) {
              // print(recognitions.toString() + 'Day la recognize');
              // setState(() {
              //   output = recognitions[0]['label'] +
              //       recognitions[0]['confidence'].toString();
              // });
            } else {
              // setState(() {
              //   output = 'Unknown';
              // });
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
          // SizedBox(
          //     height: size.height * 0.8,
          //     width: size.width,
          //     child: CameraPreview(controller)),
          _state.isOpenSpeed
              ? Text('Speed: ${_state.currentSpeed}'): ElevatedButton(
                  onPressed: () {
                    setUpSpeed();
                  },
                  child: const Text('Start'))
              ,
        ],
      ),
    );
  }

  void setUpSpeed() {
    location = Location();
    location?.onLocationChanged.listen((event) {
      _viewModel.upDateCurrentSpeed(event.speed ?? 0.0);
      debugPrint('vantocla :${_state.currentSpeed}');
    });
  }

  @override
  void dispose() {
    controller.dispose();
    Tflite.close();
    location = null;
    super.dispose();
  }
}
