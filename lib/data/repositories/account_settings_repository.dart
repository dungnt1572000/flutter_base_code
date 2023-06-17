import 'package:baseproject/data/services/preference_services/shared_preferences_manager.dart';

class AccountSettingsRepository {
  final SharePreferencesManager _sharePreferencesManager;

  AccountSettingsRepository(this._sharePreferencesManager);

  bool getThemeApp() {
    final isDarkTheme = _sharePreferencesManager.getIsDarkMode();
    return isDarkTheme ?? false;
  }

  Future<void> switchAppThemeMode(bool value) async {
    await _sharePreferencesManager.saveIsDarkMode(isDarkMode: value);
  }

  bool getIsShowDuration() {
    return _sharePreferencesManager.getIsShowSpeed() ?? true;
  }

  Future<void> saveIsShowSpeed(bool showSpeed) async {
    await _sharePreferencesManager.saveShowSpeed(isShowSpeed: showSpeed);
  }

  bool getIsShowSpeed() {
    return _sharePreferencesManager.getIsShowSpeed() ?? true;
  }

  Future<void> saveIsShowDuration(bool duration) async {
    await _sharePreferencesManager.saveShowDuration(isShowDuration: duration);
  }

  bool getIsShowDistance() {
    return _sharePreferencesManager.getIsShowSpeed() ?? true;
  }

  Future<void> saveIsShowDistance(bool distance) async {
    await _sharePreferencesManager.saveShowDistance(isShowDistance: distance);
  }

  bool getIsShowRpm() => _sharePreferencesManager.getIsShowRpm() ?? true;

  Future<void> saveIsShowRpm(bool rpm) async {
    await _sharePreferencesManager.saveIsShowRpm(isShowRpm: rpm);
  }
}
