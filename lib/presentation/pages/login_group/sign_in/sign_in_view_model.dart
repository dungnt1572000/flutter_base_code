import 'package:baseproject/presentation/domain/use_case/get_user_credential_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/set_user_id_use_case.dart';
import 'package:baseproject/presentation/pages/login_group/sign_in/sign_in_state.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInViewModel extends StateNotifier<SignInState> {
  SignInViewModel(
    this.getUserCredentialUseCase,
    this.saveUserIDUseCase,
  ) : super(const SignInState());

  GetUserCredentialUseCase getUserCredentialUseCase;
  SaveUserIDUseCase saveUserIDUseCase;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> signIn(String userName, String password) async {
    state = state.copyWith(status: LoadingStatus.inProgress);
    final result = await auth
        .signInWithEmailAndPassword(email: userName, password: password)
        .catchError((error) {
      state = state.copyWith(
        status: LoadingStatus.error,
        errorMessage: error.message ?? 'Unknown',
      );
    });
    state = state.copyWith(status: LoadingStatus.success, user: result);
    if (state.user != null) {
      await saveUserIDUseCase.run(result.user!.uid);
      return true;
    }
    return false;
  }
}
