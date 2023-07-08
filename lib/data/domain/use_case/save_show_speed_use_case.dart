import 'package:baseproject/data/domain/use_case/use_case.dart';
import 'package:baseproject/data/repositories/account_settings_repository.dart';
import 'package:baseproject/presentation/injection/injector.dart';

class SaveShowSpeedUseCase implements FutureUseCase<bool, void> {
  @override
  Future<void> run(bool input) async {
    await injector.get<AccountSettingsRepository>().saveIsShowSpeed(input);
  }
}
