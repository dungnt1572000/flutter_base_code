import 'package:baseproject/data/repositories/firebase_auth_repository.dart';
import 'package:baseproject/presentation/pages/register/register_state.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterViewModel extends StateNotifier<RegisterState> {
  RegisterViewModel({required this.flutterAuthRepository})
      : super(RegisterState());
  final FlutterAuthRepository flutterAuthRepository;

  Future<bool> loginWithEmailAndPassword(String email, String password) async {
    state = state.copyWith(status: LoadingStatus.inProgress);
    final result =
        await flutterAuthRepository.signInWithEmailAndPassword(email, password);
    if (result.isEmpty) {
      state = state.copyWith(
          errorMessage: 'Wrong Name or Password', status: LoadingStatus.error);
      return false;
    }
    state.copyWith(status: LoadingStatus.success);
    return true;
  }
}
