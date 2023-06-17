import 'package:baseproject/presentation/domain/use_case/use_case.dart';

import '../../../data/repositories/account_settings_repository.dart';
import '../../injection/injector.dart';

class GetShowDistanceUseCase implements OutputUseCase<bool>{
  @override
  bool run() {
    return injector.get<AccountSettingsRepository>().getIsShowDistance();
  }

}