import 'package:baseproject/data/services/preference_services/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SharePreferencesManager{

  SharePreferencesManager(this._sharePreferences);
  final SharedPreferences _sharePreferences;

  // save darkMode
  Future<void> saveIsDarkMode({required bool isDarkMode})async{
    _sharePreferences.setBool(PreferenceKeys.isDarkMode.name, isDarkMode);
  }
  
  // get darkMode

  bool? getIsDarkMode(){
    return _sharePreferences.getBool(PreferenceKeys.isDarkMode.name);

  }

  Future<bool> removeIsDarkMode() async{
     return _sharePreferences.remove(PreferenceKeys.isDarkMode.name);
  }

  Future<void> saveAccessToken({required String uId}) async{
    _sharePreferences.setString(PreferenceKeys.accessToken.name, uId);
  }

  String? getAccessToken(){
    return _sharePreferences.getString(PreferenceKeys.accessToken.name);
  }

  Future<bool> removeAccessToken(){
    return _sharePreferences.remove(PreferenceKeys.accessToken.name);
  }
}