import 'dart:async';

import 'package:baseproject/presentation/pages/analyze_text/analyze_text_state.dart';
import 'package:baseproject/presentation/pages/analyze_text/analyze_text_view_model.dart';
import 'package:baseproject/presentation/widget/snack_bar/error_snack_bar.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:translator/translator.dart';

List<String> listLanguages = [
  'vi',
  'en',
  'ko',
  'pt',
  'de',
  'ru',
  'zh-cn',
  'zh-tw'
];

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
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  final translator = GoogleTranslator();
  List<String> translatedListText = [];

  late Timer _timer;
  int _start = 10;

  @override
  void initState() {
    super.initState();
    makeTextInImage(widget.xFile.path);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _start = _start - 1;
      });
      if (_start <= 0 &&
          (translatedListText.length <= state.listTextBlock.length)) {
            _timer.cancel();
        showErrorSnackBar(context: context, errorMessage: 'can not translate');
        Navigator.of(context).pop();   
      }
      if(translatedListText.length == state.listTextBlock.length && state.listTextBlock.isNotEmpty){
        _timer.cancel();
      }
      print(_start);
    });
  }

  Future<void> translatedText(List<TextBlock> text) async {
    translatedListText = [];
    _viewModel.setLoadingStatus(LoadingStatus.inProgress);
    for (int i = 0; i < text.length; i++) {
      final txt = await translator.translate(text[i].text,
          from: text[i].recognizedLanguages[0], to: state.translateLanguages);
      translatedListText.add(txt.text);
    }
  }

  void makeTextInImage(String filePath) {
    try {
      final inputImage = InputImage.fromFilePath(filePath);
      Future.delayed(Duration.zero, () async {
        final RecognizedText recognizedText =
            await textRecognizer.processImage(inputImage);
        _viewModel.setTextBlock(recognizedText.blocks);
        await translatedText(recognizedText.blocks);
        _viewModel.setTextforTransltatedText(translatedListText);
        _viewModel.setLoadingStatus(LoadingStatus.success);
        print(translatedListText);
        await DefaultCacheManager().removeFile(filePath);
      });
    } on Exception catch (_) {
      showErrorSnackBar(
          context: context,
          errorMessage:
              'Cannot translate this text to ${state.translateLanguages}');
    }
  }

  @override
  void dispose() {
    super.dispose();
    textRecognizer.close();
    _timer.cancel();
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
        appBar: AppBar(title: const Text('Analyzed Text'), actions: [
          DropdownButton<String>(
            value: state.translateLanguages,
            items: listLanguages
                .map<DropdownMenuItem<String>>(
                    (e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) async {
              _viewModel.setLanguages(value ?? 'en');
              await translatedText(state.listTextBlock);
              _viewModel.setLoadingStatus(LoadingStatus.success);
            },
          ),
        ]),
        body: SafeArea(
            child: state.status == LoadingStatus.inProgress ||
                    state.listTranslatedText.isEmpty
                ? Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Loading......'),
                      ],
                    ),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(state.listTextBlock[index].text)),
                          Expanded(
                            flex: 1,
                            child: Text(translatedListText[index]),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.listTextBlock.length)),
      ),
    );
  }
}
