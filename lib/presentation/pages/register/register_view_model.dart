import 'package:baseproject/data/repositories/firebase_auth_repository.dart';
import 'package:baseproject/presentation/pages/register/register_state.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterViewModel extends StateNotifier<RegisterState>{
  RegisterViewModel({required this.flutterAuthRepository}): super(RegisterState());

  final FlutterAuthRepository flutterAuthRepository;

  Future<bool> createAccount(String email, String password)async{
    state = state.copyWith(status: LoadingStatus.inProgress);
    final result = await flutterAuthRepository.createUserWithEmailAndPassword(email, password);
    if(result){
      state = state.copyWith(
        status: LoadingStatus.success,
        email: email,
        password: password,
      );
    }else{
      state = state.copyWith(
        status: LoadingStatus.error,
        errorMessage: 'Cannot Create New Account'
      );
    }
    return result;
  }
}