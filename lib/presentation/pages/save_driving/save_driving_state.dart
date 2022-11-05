import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_driving_state.freezed.dart';
@freezed
class SaveDrivingState with _$SaveDrivingState{
  factory SaveDrivingState({
    @Default(0.0) double currentSpeed,
    @Default('') String errorMessage,
  }) = _SaveDrivingState;
}