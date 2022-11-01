import 'package:baseproject/data/repositories/account_settings_repository.dart';
import 'package:baseproject/data/repositories/user_map_repository.dart';
import 'package:baseproject/data/services/network_service/api_client.dart';
import 'package:baseproject/data/services/network_service/dio_helper.dart';
import 'package:baseproject/data/services/network_service/network_action_manager.dart';
import 'package:baseproject/data/services/network_service/not_found_404_interceptor.dart';
import 'package:baseproject/data/services/preference_services/shared_preferences_manager.dart';
import 'package:baseproject/presentation/domain/use_case/get_app_theme_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/get_driving_direction_object_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/get_searching_object_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/get_walking_direction_object_use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModules {
  static Future<void> inject() async {
    injector.registerLazySingleton<Dio>(() {
      final notFound404Interceptor =
          NotFound404Interceptor(injector.get<NetworkActionManager>());
      return DioHelper.configDio(
        notFound404Interceptor: notFound404Interceptor,
      );
    });

    injector.registerLazySingleton<NetworkActionManager>(
      () => NetworkActionManager(),
    );

    injector.registerLazySingletonAsync<SharedPreferences>(() async {
      return SharedPreferences.getInstance();
    });
    injector.registerLazySingleton<SharePreferencesManager>(
      () => SharePreferencesManager(injector.get<SharedPreferences>()),
    );
    injector.registerLazySingleton<AccountSettingsRepository>(
      () => AccountSettingsRepository(injector.get<SharePreferencesManager>()),
    );
    injector.registerLazySingleton<GetAppThemeUseCase>(
      () => GetAppThemeUseCase(),
    );
    injector.registerLazySingleton<UserMapRepository>(
      () => UserMapRepository(
        injector.get<ApiClient>(),
      ),
    );
    injector.registerLazySingleton<GetSearchingObjectUseCase>(
      () => GetSearchingObjectUseCase(),
    );
    injector.registerLazySingleton<GetDrivingDirectionObjectUseCase>(
      () => GetDrivingDirectionObjectUseCase(),
    );
    injector.registerLazySingleton<GetWalkingDirectionObjectUseCase>(
      () => GetWalkingDirectionObjectUseCase(),
    );
  }
}
