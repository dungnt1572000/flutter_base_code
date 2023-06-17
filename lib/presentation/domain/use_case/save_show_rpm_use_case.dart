import 'package:baseproject/presentation/domain/use_case/use_case.dart';

import '../../../data/repositories/account_settings_repository.dart';
import '../../injection/injector.dart';

class SaveShowRpmUseCase implements FutureUseCase<bool, void> {
  @override
  Future<void> run(bool input) async {
    await injector.get<AccountSettingsRepository>().saveIsShowRpm(input);
  }
}
