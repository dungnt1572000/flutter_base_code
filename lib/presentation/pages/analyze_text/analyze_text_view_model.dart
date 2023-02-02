import 'package:baseproject/presentation/pages/analyze_text/analyze_text_state.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnalyzeTextViewModel extends StateNotifier<AnalyzeTextState> {
  AnalyzeTextViewModel() : super(AnalyzeTextState());
  void setLoadingStatus(LoadingStatus status) {
    state = state.copyWith(status: status);
  }

  void setText(String text) {
    state = state.copyWith(text: text);
  }

  String get takeTheText => state.text;
}
