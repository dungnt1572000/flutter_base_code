import 'package:baseproject/ultilities/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
part 'analyze_text_state.freezed.dart';
@freezed
class AnalyzeTextState with _$AnalyzeTextState {
  factory AnalyzeTextState({
    @Default(LoadingStatus.inProgress) LoadingStatus status,
    @Default([]) List<TextBlock> listTextBlock,
    @Default([]) List<String> listTranslatedText,
    @Default('en') String translateLanguages
  }) = _AnalyzeTextState;
}