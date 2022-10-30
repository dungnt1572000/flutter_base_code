import 'package:baseproject/data/services/network_service/extension_error.dart';
import 'package:baseproject/presentation/domain/use_case/save_access_token_use_case.dart';
import 'package:baseproject/presentation/pages/login/login_state.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel(
    this.saveAccessTokenUseCase,
  ) : super(LoginState());
  SaveAccessTokenUseCase saveAccessTokenUseCase;

  Future<bool> login(String email, String password) async {
    state = state.copyWith(status: LoadingStatus.inProgress);
    try {
      final user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      debugPrint('This is User: ${user.user?.uid}');
      saveAccessTokenUseCase.run(
        user.user?.uid ?? '',
      );
      state = state.copyWith(status: LoadingStatus.success);
      return true;
    } on FirebaseException catch (error) {
      state = state.copyWith(
        status: LoadingStatus.error,
        errorMessage: error.message ?? 'Unknow',
      );
    }
    return false;
  }
}
