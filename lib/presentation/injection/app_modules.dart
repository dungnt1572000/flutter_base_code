import 'package:baseproject/data/repositories/account_settings_repository.dart';
import 'package:baseproject/data/services/preference_services/shared_preferences_manager.dart';
import 'package:baseproject/presentation/domain/use_case/get_app_theme_use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModules {
  static Future<void> inject() async {

    injector.registerLazySingletonAsync<SharedPreferences>(() async{
        return SharedPreferences.getInstance();
    });
    injector.registerLazySingleton<SharePreferencesManager>(
      () => SharePreferencesManager(
        injector.get<SharedPreferences>()
      ),
    );
    injector.registerLazySingleton<AccountSettingsRepository>(
      () => AccountSettingsRepository(injector.get<SharePreferencesManager>()),
    );
    injector.registerLazySingleton<GetAppThemeUseCase>(
      () => GetAppThemeUseCase(),
    );
  }
}
