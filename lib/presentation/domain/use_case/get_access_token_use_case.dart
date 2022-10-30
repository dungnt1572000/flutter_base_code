import 'package:baseproject/data/services/preference_services/shared_preferences_manager.dart';
import 'package:baseproject/presentation/domain/use_case/use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';

class GetAccessTokenUseCase implements OutputUseCase<String?>{
  @override
  String? run() {
    final accessToken = injector.get<SharePreferencesManager>().getAccessToken();
    return accessToken;
  }

}