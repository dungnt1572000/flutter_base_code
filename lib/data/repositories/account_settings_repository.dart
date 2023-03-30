import 'package:baseproject/data/services/preference_services/shared_preferences_manager.dart';
class AccountSettingsRepository{
  final SharePreferencesManager _sharePreferencesManager;
  AccountSettingsRepository(this._sharePreferencesManager);
  bool getThemeApp(){
    final isDarkTheme = _sharePreferencesManager.getIsDarkMode();
    return isDarkTheme ?? false;
  }

  Future<void> switchAppThemeMode(bool value) async{
    await _sharePreferencesManager.saveIsDarkMode(isDarkMode: value);
  }

}