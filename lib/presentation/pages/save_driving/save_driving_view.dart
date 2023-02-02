import 'dart:io';

import 'package:baseproject/main.dart';
import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/pages/analyze_text/analyze_text_view.dart';
import 'package:baseproject/presentation/pages/home/home_view.dart';
import 'package:baseproject/presentation/pages/save_driving/object_box_gen/object_box_gen.dart';
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
  Rect? box;
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
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return CameraPreview(
                    controller,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CustomPaint(
                          painter: ObjectBox(
                            rect: Rect.fromPoints(
                              Offset(constraints.maxWidth * 1 / 10,
                                  constraints.maxHeight * 1 / 10),
                              Offset(constraints.maxWidth * 9 / 10,
                                  constraints.maxHeight * 9 / 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: IconButton(
                  onPressed: () async {
                    final xFile = await controller.takePicture();
                    ref.read(appNavigatorProvider).navigateTo(
                        Approutes.analyzedTextScreen,
                        arguments: AnalyzeTextViewArgument(xFile));
                  },
                  icon: const Icon(
                    Icons.circle_outlined,
                    size: 32,
                  ),
                ),
              )
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
