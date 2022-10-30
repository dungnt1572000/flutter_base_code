import 'package:baseproject/presentation/domain/repositories/account_repository.dart';
import 'package:baseproject/presentation/domain/use_case/use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';

class SaveAccessTokenUseCase extends UseCase<String,void>{
  @override
  void run(String input)async {
    await injector.get<AccountRepository>().saveAccessToken( input);
  }
}