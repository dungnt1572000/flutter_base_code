import 'package:baseproject/ultilities/loading_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState{
  const factory SignInState({
    @Default(LoadingStatus.initial) status,
    UserCredential? user,
}) = _SignInState;
}