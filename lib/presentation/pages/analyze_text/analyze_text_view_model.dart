import 'package:baseproject/presentation/pages/analyze_text/analyze_text_state.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class AnalyzeTextViewModel extends StateNotifier<AnalyzeTextState> {
  AnalyzeTextViewModel() : super(AnalyzeTextState());
  void setLoadingStatus(LoadingStatus status) {
    state = state.copyWith(status: status);
  }

  void setTextBlock(List<TextBlock> listTextBlock){
      state = state.copyWith(listTextBlock: listTextBlock);
  }

  void setTextforTransltatedText(List<String> translatedText){
    state = state.copyWith(listTranslatedText: translatedText);
  }

  void setLanguages(String languages){
    state = state.copyWith(translateLanguages: languages);
  }

}
