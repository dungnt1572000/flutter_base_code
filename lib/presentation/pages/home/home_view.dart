import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await signIn();
            },
            child: Text('hello')),
      ),
    );
  }

  Future signIn() async {
    final al = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'dung@gmail.com', password: '123456');
    debugPrint('kekeke ${al.user?.email} ');
  }
}
