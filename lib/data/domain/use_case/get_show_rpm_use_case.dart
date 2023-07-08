import 'package:baseproject/data/domain/use_case/use_case.dart';

import '../../../data/repositories/account_settings_repository.dart';
import '../../../presentation/injection/injector.dart';

class GetShowRpmUseCase implements OutputUseCase<bool> {
  @override
  bool run() {
    return injector.get<AccountSettingsRepository>().getIsShowRpm();
  }
}
