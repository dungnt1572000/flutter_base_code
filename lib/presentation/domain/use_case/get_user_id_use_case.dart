import 'package:baseproject/data/repositories/account_settings_repository.dart';
import 'package:baseproject/presentation/domain/use_case/use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';

class GetUserIDUseCase extends OutputUseCase<String> {
  @override
  String run() {
    return injector.get<AccountSettingsRepository>().getUserID() ?? '';
  }
}
