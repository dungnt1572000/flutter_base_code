import 'package:baseproject/ultilities/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default('') String errorMessage,
    @Default(LoadingStatus.initial) LoadingStatus status,
  }) = _LoginState;
}
