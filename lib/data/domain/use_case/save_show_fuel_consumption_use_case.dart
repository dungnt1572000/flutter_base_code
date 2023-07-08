import 'package:baseproject/data/domain/use_case/use_case.dart';

import '../../../data/repositories/account_settings_repository.dart';
import '../../../presentation/injection/injector.dart';

class SaveShowFuelConsumptionUseCase implements FutureUseCase<bool, void> {
  @override
  Future<void> run(bool input) async {
    await injector
        .get<AccountSettingsRepository>()
        .saveIsFuelConsumption(input);
  }
}
