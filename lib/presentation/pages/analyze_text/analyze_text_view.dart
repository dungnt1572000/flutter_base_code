import 'dart:async';
import 'dart:isolate';

import 'package:baseproject/presentation/pages/analyze_text/analyze_text_state.dart';
import 'package:baseproject/presentation/pages/analyze_text/analyze_text_view_model.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class AnalyzeTextViewArgument {
  final XFile xFile;

  AnalyzeTextViewArgument(this.xFile);
}

final _provider =
    StateNotifierProvider.autoDispose<AnalyzeTextViewModel, AnalyzeTextState>(
  (ref) => AnalyzeTextViewModel(),
);


class AnalyzeTextView extends ConsumerStatefulWidget {
  const AnalyzeTextView({required this.xFile, super.key});
  final XFile xFile;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AnalyzeTextViewState();
}


class _AnalyzeTextViewState extends ConsumerState<AnalyzeTextView> {
  AnalyzeTextState get state => ref.watch(_provider);
  AnalyzeTextViewModel get _viewModel => ref.read(_provider.notifier);
  late Timer timer;
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     makeTextInImage(widget.xFile.path);
  }
  void makeTextInImage(String filePath) {
    try {
      final inputImage = InputImage.fromFilePath(filePath);
      String textValue='';
      Future.delayed(Duration.zero, () async {
        final RecognizedText recognizedText =
            await textRecognizer.processImage(inputImage);
        for (int i = 0; i < recognizedText.blocks.length; i++) {
          final String text = recognizedText.blocks[i].text;
          // final List<String> languages = recognizedText.blocks[i].recognizedLanguages;

          // Same getters as TextBlock
          textValue+= 'Block $i:\n$text\n';
          
        }
              print('Day la text value: '+textValue);
      _viewModel.setText(textValue);
      _viewModel.setLoadingStatus(LoadingStatus.success);
      DefaultCacheManager().removeFile(filePath);
      }
      
      );
    } on Exception catch (_, e) {
      _viewModel.setText(' Can not detection anything.');
    }
  }

  @override
  void dispose() {
    super.dispose();
    textRecognizer.close();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        // final file = await DefaultCacheManager().removeFile(widget.xFile.path);
        return true;
      },
      child: Scaffold(
        body: SafeArea(
            child: Center(
          child: state.status == LoadingStatus.inProgress
              ? Column(
                  children: const [
                    CircularProgressIndicator(),
                    Text('Loading......'),
                  ],
                )
              : Text(state.text),
        )),
      ),
    );
  }
}
