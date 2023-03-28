import 'package:firebase_auth/firebase_auth.dart';

class FlutterAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user?.uid ?? '';
    } catch (e) {
      return '';
    }
  }
}
