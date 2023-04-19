import 'package:freezed_annotation/freezed_annotation.dart';

part 'obd_detail_state.freezed.dart';

@freezed
class ObdDetailState with _$ObdDetailState{
  factory ObdDetailState({
    @Default(0) double value,
}) = _ObdDetailState;
}