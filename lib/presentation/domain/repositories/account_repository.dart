import 'package:baseproject/data/services/preference_services/shared_preferences_manager.dart';

class AccountRepository {
  final SharePreferencesManager sharePreferencesManager;

  AccountRepository(this.sharePreferencesManager);

  Future saveAccessToken(String accessToken) async {
    await sharePreferencesManager.saveAccessToken(uId: accessToken);
  }
}
