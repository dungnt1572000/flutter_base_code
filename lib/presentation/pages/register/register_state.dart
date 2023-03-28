import 'package:baseproject/ultilities/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState({
    @Default('') String errorMessage,
    @Default(LoadingStatus.initial) LoadingStatus status,
  }) = _RegisterState;
}
