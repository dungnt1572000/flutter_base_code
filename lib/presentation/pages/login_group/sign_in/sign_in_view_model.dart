import 'package:baseproject/presentation/domain/use_case/get_user_credential_use_case.dart';
import 'package:baseproject/presentation/pages/login_group/sign_in/sign_in_state.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInViewModel extends StateNotifier<SignInState> {
  SignInViewModel(this.getUserCredentialUseCase) : super(const SignInState());

  GetUserCredentialUseCase getUserCredentialUseCase;

  Future<bool> signIn(String userName, String password)async{
    state = state.copyWith(
      status: LoadingStatus.inProgress
    );
    final result = await getUserCredentialUseCase.run(SignInRequirement(userName, password));
    if(result==null){
      state = state.copyWith(
        status: LoadingStatus.error,
      );
      return false;
    }else{
      state = state.copyWith(
        status: LoadingStatus.success,
        user: result,
      );
      return true;
    }
  }
}
