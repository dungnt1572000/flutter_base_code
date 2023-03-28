import 'package:baseproject/data/providers/flutter_auth_repository_provider.dart';
import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/pages/register/register_state.dart';
import 'package:baseproject/presentation/pages/register/register_view_model.dart';
import 'package:baseproject/presentation/widget/app_indicator/app_loading_overlayed.dart';
import 'package:baseproject/presentation/widget/snack_bar/error_snack_bar.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider =
    StateNotifierProvider.autoDispose<RegisterViewModel, RegisterState>(
  (ref) => RegisterViewModel(
    flutterAuthRepository: ref.watch(
      flutterAuthRepository,
    ),
  ),
);

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterViewModel get viewModel => ref.read(_provider.notifier);

  RegisterState get state => ref.read(_provider);

  @override
  Widget build(BuildContext context) {
    ref.listen(_provider, (RegisterState? previous, RegisterState next) {
      if (previous!.status != next.status && next.status == LoadingStatus.error) {
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
                        final result = await viewModel.loginWithEmailAndPassword(
                            _usernameController.text, _passwordController.text);
                        if (result) {
                          ref
                              .read(appNavigatorProvider)
                              .navigateTo(AppRoutes.home);
                        }
                      },
                      child: const Text('Login')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
