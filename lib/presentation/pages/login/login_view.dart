import 'package:baseproject/data/providers/flutter_auth_repository_provider.dart';
import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/pages/login/login_view_model.dart';
import 'package:baseproject/presentation/pages/reset_password/reset_password.dart';
import 'package:baseproject/presentation/widget/app_indicator/app_loading_overlayed.dart';
import 'package:baseproject/presentation/widget/snack_bar/error_snack_bar.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_state.dart';

final _provider = StateNotifierProvider.autoDispose<LoginViewModel, LoginState>(
  (ref) => LoginViewModel(
    flutterAuthRepository: ref.watch(
      flutterAuthRepositoryProvider,
    ),
  ),
);

class LoginBackArgument {
  String email;
  String password;

  LoginBackArgument(this.email, this.password);
}

class LoginView extends ConsumerStatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginViewModel get viewModel => ref.read(_provider.notifier);

  LoginState get state => ref.read(_provider);

  @override
  Widget build(BuildContext context) {
    ref.listen(_provider, (LoginState? previous, LoginState next) {
      if (previous!.status != next.status &&
          next.status == LoadingStatus.error) {
        showErrorSnackBar(context: context, errorMessage: state.errorMessage);
      }
    });

    return Scaffold(
      body: SafeArea(
        child: AppLoadingOverlay(
          status: state.status,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text('Login'),
                  const SizedBox(
                    height: 32,
                  ),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(hintText: 'email'),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(hintText: 'password'),
                      )
                    ],
                  )),
                  const SizedBox(
                    height: 24,
                  ),
                  TextButton(
                      onPressed: () async {
                        final result =
                            await viewModel.loginWithEmailAndPassword(
                                _usernameController.text,
                                _passwordController.text);
                        if (result) {
                          ref
                              .read(appNavigatorProvider)
                              .navigateTo(AppRoutes.main);
                        }
                      },
                      child: const Text('Login')),
                  const SizedBox(
                    height: 24,
                  ),
                  TextButton(
                      onPressed: () {
                        ref.read(appNavigatorProvider).navigateTo(
                            AppRoutes.resetPassword,
                            arguments: ResetPasswordArgument(
                                _usernameController.text));
                      },
                      child: const Text('forgot password')),
                  const SizedBox(
                    height: 24,
                  ),
                  TextButton(
                      onPressed: () async {
                        final result = await ref
                            .read(appNavigatorProvider)
                            .navigateTo(AppRoutes.register);
                        if (result is LoginBackArgument) {
                          _usernameController.text = result.email;
                          _passwordController.text = result.password;
                        }
                      },
                      child: const Text('Create new account')),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
