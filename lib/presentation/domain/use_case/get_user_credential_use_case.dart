import 'package:baseproject/data/repositories/account_settings_repository.dart';
import 'package:baseproject/presentation/domain/use_case/use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUserCredentialUseCase
    extends FutureUseCase<SignInRequirement, UserCredential?> {
  @override
  Future<UserCredential?> run(SignInRequirement input) async {
    return await injector
        .get<AccountSettingsRepository>()
        .signIn(input.userName, input.password);
  }
}

class SignInRequirement {
  String userName;
  String password;

  SignInRequirement(this.userName, this.password);
}
