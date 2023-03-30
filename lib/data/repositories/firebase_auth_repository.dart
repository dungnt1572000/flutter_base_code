import 'package:baseproject/data/services/preference_services/shared_preferences_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../model/current_user_information.dart';

class FlutterAuthRepository {
  FlutterAuthRepository(this.sharePreferencesManager);

  final SharePreferencesManager sharePreferencesManager;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CurrentUserInformation currentUserInformation =
      CurrentUserInformation();

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      sharePreferencesManager.saveUserUId(userCredential.user?.uid ?? '');
      return userCredential.user?.uid ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<bool> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final id = credential.user?.uid;
      DatabaseReference ref = FirebaseDatabase.instance.ref(id);
      await ref.set({
        'name': credential.user?.email ?? '',
        'postNumber': 0,
        'star': 0,
        'age': 0,
        'postID': {
          'none': true,
        }
      });
      await getUserInformation(id ?? '');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<CurrentUserInformation> getUserInformation(String uID) async {
    final id = sharePreferencesManager.getUserUId();
    DatabaseReference ref = FirebaseDatabase.instance.ref(uID);
    final result = await ref.get();
    print('day la result :${result.value}');
    final ketqua = result.value as Map<dynamic, dynamic>;

    print('Day la value tra ve: ${ketqua['star']}');
    currentUserInformation.copyWith(
      star: ketqua['name'],
      email: ketqua['name'],
      postCount: ketqua['postNumber'],
    );
    print('Day la user: ${currentUserInformation.email}');
    return currentUserInformation;
  }
}
