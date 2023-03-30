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

  /// uID
  Future<void> saveUserUId(String uID)async{
    await _sharePreferences.setString(PreferenceKeys.uID.name, uID);
  }
  String? getUserUId(){
    return _sharePreferences.getString(PreferenceKeys.uID.name);
  }
}