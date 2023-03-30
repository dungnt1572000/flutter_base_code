import 'package:baseproject/presentation/widget/snack_bar/error_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPasswordArgument {
  String email;

  ResetPasswordArgument(this.email);
}

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key, required this.argument}) : super(key: key);
  final ResetPasswordArgument argument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text(
                  'We sent reset password link to you email. Please check it and login'),
              const SizedBox(
                height: 32,
              ),
              TextButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: argument.email);
                    } catch (e) {
                      showErrorSnackBar(
                          context: context, errorMessage: e.toString());
                    }
                    if (!context.mounted) return;
                    Navigator.of(context).pop();
                  },
                  child: const Text('Back to home')),
            ],
          ),
        ),
      ),
    );
  }
}
