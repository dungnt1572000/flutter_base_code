import 'package:freezed_annotation/freezed_annotation.dart';

part 'obd_detail_state.freezed.dart';

@freezed
class ObdDetailState with _$ObdDetailState{
  factory ObdDetailState({
    @Default(0) double speed,
    @Default(0) double rpm,
    @Default(0) double nhietdodongco,
    @Default(0) double mucnhienlieu
}) = _ObdDetailState;
}