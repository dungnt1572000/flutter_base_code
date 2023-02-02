import 'package:baseproject/ultilities/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'analyze_text_state.freezed.dart';
@freezed
class AnalyzeTextState with _$AnalyzeTextState {
  factory AnalyzeTextState({
    @Default('') String text,
    @Default(LoadingStatus.inProgress) LoadingStatus status,
  }) = _AnalyzeTextState;
}