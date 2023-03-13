import 'package:baseproject/data/services/preference_services/shared_preferences_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountSettingsRepository {
  final SharePreferencesManager _sharePreferencesManager;
  FirebaseAuth auth = FirebaseAuth.instance;

  AccountSettingsRepository(this._sharePreferencesManager);

  bool getThemeApp() {
    final isDarkTheme = _sharePreferencesManager.getIsDarkMode();
    return isDarkTheme ?? false;
  }

  Future<void> switchAppThemeMode(bool value) async {
    await _sharePreferencesManager.saveIsDarkMode(isDarkMode: value);
  }

  Future<UserCredential?> signIn(String userName, String password) async {
    UserCredential? result;
    try {
      result = await auth.signInWithEmailAndPassword(
          email: userName, password: password);
    } catch (error) {
      result = null;
    }
    return result;
  }

  Future<void> saveUserId(String userID) async {
    await _sharePreferencesManager.saveUserId(userID: userID);
  }

  String? getUserID() {
    return _sharePreferencesManager.getUserID();
  }
}
