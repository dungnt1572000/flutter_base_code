import 'package:baseproject/data/services/preference_services/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencesManager {
  SharePreferencesManager(this._sharePreferences);

  final SharedPreferences _sharePreferences;

  // save darkMode
  Future<void> saveIsDarkMode({required bool isDarkMode}) async {
    _sharePreferences.setBool(PreferenceKeys.isDarkMode.name, isDarkMode);
  }

  // get darkMode

  bool? getIsDarkMode() {
    return _sharePreferences.getBool(PreferenceKeys.isDarkMode.name);
  }

  Future<bool> removeIsDarkMode() async {
    return _sharePreferences.remove(PreferenceKeys.isDarkMode.name);
  }

  // save showSpeed
  Future<void> saveShowSpeed({required bool isShowSpeed}) async {
    _sharePreferences.setBool(PreferenceKeys.isShowSpeed.name, isShowSpeed);
  }

  bool? getIsShowSpeed() {
    return _sharePreferences.getBool(PreferenceKeys.isShowSpeed.name);
  }

  Future<bool> removeIsShowSpeed() async {
    return _sharePreferences.remove(PreferenceKeys.isShowSpeed.name);
  }

  // save showDuration
  Future<void> saveShowDuration({required bool isShowDuration}) async {
    _sharePreferences.setBool(
        PreferenceKeys.isShowDuration.name, isShowDuration);
  }

  bool? getIsShowDuration() {
    return _sharePreferences.getBool(PreferenceKeys.isShowDuration.name);
  }

  Future<bool> removeIsShowDuration() async {
    return _sharePreferences.remove(PreferenceKeys.isShowDuration.name);
  }

  // save showSpeed
  Future<void> saveShowDistance({required bool isShowDistance}) async {
    _sharePreferences.setBool(
        PreferenceKeys.isShowDistance.name, isShowDistance);
  }

  bool? getIsShowDistance() {
    return _sharePreferences.getBool(PreferenceKeys.isShowDistance.name);
  }

  Future<bool> removeIsShowDistance() async {
    return _sharePreferences.remove(PreferenceKeys.isShowDistance.name);
  }

  Future<void> saveIsShowRpm({required bool isShowRpm}) async {
    _sharePreferences.setBool(PreferenceKeys.isShowRpm.name, isShowRpm);
  }

  bool? getIsShowRpm() =>
      _sharePreferences.getBool(PreferenceKeys.isShowRpm.name);

  Future<bool> removeIsShowRpm() async =>
      _sharePreferences.remove(PreferenceKeys.isShowRpm.name);

  Future<void> saveIsShowFuelConsumption(
      {required bool fuelConsumption}) async {
    _sharePreferences.setBool(
        PreferenceKeys.isShowFuelConsumption.name, fuelConsumption);
  }

  bool? getIsShowFuelConsumption() =>
      _sharePreferences.getBool(PreferenceKeys.isShowFuelConsumption.name);

  Future<bool> removeIsShowFuelConsumption() async =>
      _sharePreferences.remove(PreferenceKeys.isShowFuelConsumption.name);
}
