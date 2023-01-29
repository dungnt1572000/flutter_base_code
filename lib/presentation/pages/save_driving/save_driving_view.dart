import 'package:baseproject/main.dart';
import 'package:baseproject/presentation/pages/home/home_view.dart';
import 'package:baseproject/presentation/pages/save_driving/save_driving_state.dart';
import 'package:baseproject/presentation/pages/save_driving/save_driving_view_model.dart';
import 'package:baseproject/presentation/resources/app_text_styles.dart';
import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
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
  SaveDrivingState get _state => ref.watch(provider);
  SaveDrivingViewModel get _viewModel => ref.read(provider.notifier);
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    });

    controller = CameraController(cameras[0], ResolutionPreset.max);
    Future.delayed(Duration.zero, () async {
      await controller.unlockCaptureOrientation();
    });
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      controller.startImageStream((cameraImage) async {
        _imageCount++;
        if (_imageCount == 20) {
          _imageCount = 0;
          print('object');
          final WriteBuffer allBytes = WriteBuffer();
          for (final Plane plane in cameraImage.planes) {
            allBytes.putUint8List(plane.bytes);
          }
          final bytes = allBytes.done().buffer.asUint8List();

          final Size imageSize =
              Size(cameraImage.width.toDouble(), cameraImage.height.toDouble());

          final InputImageFormat? inputImageFormat =
              InputImageFormatValue.fromRawValue(cameraImage.format.raw);

          final planeData = cameraImage.planes.map(
            (Plane plane) {
              return InputImagePlaneMetadata(
                bytesPerRow: plane.bytesPerRow,
                height: plane.height,
                width: plane.width,
              );
            },
          ).toList();

          final inputImageData = InputImageData(
            size: imageSize,
            imageRotation: InputImageRotation.rotation0deg,
            inputImageFormat: inputImageFormat ?? InputImageFormat.bgra8888,
            planeData: planeData,
          );

          final inputImage = InputImage.fromBytes(
              bytes: bytes, inputImageData: inputImageData);
          final RecognizedText recognizedText =
              await textRecognizer.processImage(inputImage);

          String text = recognizedText.text;
          for (TextBlock block in recognizedText.blocks) {
            final String text = block.text;
            final List<String> languages = block.recognizedLanguages;

            for (TextLine line in block.lines) {
              // Same getters as TextBlock
              print(line.text);
             
            }
          }
          // final WriteBuffer allBytes = WriteBuffer();
          // for (final Plane plane in image.planes) {
          //   allBytes.putUint8List(plane.bytes);
          //   final bytes = allBytes.done().buffer.asUint8List();

          //   final Size imageSize =
          //       Size(image.width.toDouble(), image.height.toDouble());

          //   final InputImageFormat? inputImageFormat =
          //       InputImageFormatValue.fromRawValue(image.format.raw);

          //   final planeData = image.planes.map(
          //     (Plane plane) {
          //       return InputImagePlaneMetadata(
          //         bytesPerRow: plane.bytesPerRow,
          //         height: plane.height,
          //         width: plane.width,
          //       );
          //     },
          //   ).toList();

          //   final inputImageData = InputImageData(
          //     size: imageSize,
          //     imageRotation: InputImageRotation.rotation0deg,
          //     inputImageFormat: inputImageFormat ?? InputImageFormat.yv12,
          //     planeData: planeData,
          //   );

          //   final inputImage = InputImage.fromBytes(
          //       bytes: bytes, inputImageData: inputImageData);
          //   final RecognizedText recognizedText =
          //       await textRecognizer.processImage(inputImage);

          //   String text = recognizedText.text;
          //   for (TextBlock block in recognizedText.blocks) {
          //     final Rect rect = block.boundingBox;
          //     final String text = block.text;

          //     for (TextLine line in block.lines) {
          //       print(line.text);
          //       // for (TextElement element in line.elements) {

          //       // }
          //     }
          //   }
          // }
        }
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // if (!controller.value.isInitialized) {
    //   return Container();
    // }
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: CameraPreview(
                  controller,
                  child: Stack(fit: StackFit.expand, children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Current speed: ${_state.currentSpeed}',
                          style: AppTextStyles.textLarge
                              .copyWith(color: context.colors.alert),
                        ))
                  ]),
                ),
              ),
              const Text('Chu y canh bao:'),
            ],
          ),
        ),
      ),
    );
  }

  void setUpSpeed() {
    location = Location();
    debugPrint('$location');
    location?.onLocationChanged.listen((event) {
      _viewModel.upDateCurrentSpeed(event.speed ?? 0.0);
      debugPrint('vantocla :${_state.currentSpeed}');
    });
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    controller.dispose();
    Tflite.close();
    location = null;
    super.dispose();
  }
}
