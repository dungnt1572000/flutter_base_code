import 'package:baseproject/data/repositories/account_settings_repository.dart';
import 'package:baseproject/presentation/domain/use_case/use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';

class GetAppThemeUseCase extends OutputUseCase<bool>{
  @override
  bool run() {
    return injector.get<AccountSettingsRepository>().getThemeApp();
  }

}