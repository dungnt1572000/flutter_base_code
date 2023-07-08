import 'package:baseproject/data/domain/use_case/use_case.dart';
import 'package:baseproject/data/repositories/account_settings_repository.dart';
import 'package:baseproject/presentation/injection/injector.dart';

class GetShowSpeedUseCase implements OutputUseCase<bool> {
  @override
  bool run() {
    return injector.get<AccountSettingsRepository>().getIsShowDuration();
  }
}
