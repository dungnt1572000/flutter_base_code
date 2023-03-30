import 'package:baseproject/data/providers/flutter_auth_repository_provider.dart';
import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/pages/login/login_view.dart';
import 'package:baseproject/presentation/pages/register/register_state.dart';
import 'package:baseproject/presentation/pages/register/register_view_model.dart';
import 'package:baseproject/presentation/widget/app_indicator/app_loading_overlayed.dart';
import 'package:baseproject/presentation/widget/snack_bar/error_snack_bar.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:baseproject/ultilities/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validator/form_validator.dart';

final _provider =
    StateNotifierProvider.autoDispose<RegisterViewModel, RegisterState>((ref) =>
        RegisterViewModel(
            flutterAuthRepository: ref.watch(flutterAuthRepositoryProvider)));

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  void _validate() {
    _form.currentState?.validate();
  }

  RegisterViewModel get viewModel => ref.read(_provider.notifier);

  RegisterState get state => ref.read(_provider);

  @override
  Widget build(BuildContext context) {
    ref.listen(_provider, (RegisterState? previous, RegisterState next) {
      if (previous!.status != next.status &&
          next.status == LoadingStatus.error) {
        showErrorSnackBar(context: context, errorMessage: state.errorMessage);
      }
    });

    return Scaffold(
      body: SafeArea(
        child: AppLoadingOverlay(
          status: state.status,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: Column(
                children: [
                  const Text('Register'),
                  const SizedBox(
                    height: 32,
                  ),
                  Form(
                      key: _form,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration:
                                const InputDecoration(hintText: 'Email'),
                            validator:
                                ValidationBuilder().email().required().build(),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: passwordController,
                            decoration:
                                const InputDecoration(hintText: 'password'),
                            validator: ValidationBuilder()
                                .minLength(6)
                                .required()
                                .build(),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: confirmPasswordController,
                            decoration: const InputDecoration(
                                hintText: 'Confirm password'),
                            validator: ValidationBuilder()
                                .minLength(6)
                                .required()
                                .matchString(
                                  () => passwordController.text,
                                )
                                .build(),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextButton(
                              onPressed: () async {
                                _validate();
                                final result = await viewModel.createAccount(
                                    emailController.text,
                                    passwordController.text);
                                if (result) {
                                  ref.read(appNavigatorProvider).goBack(
                                        arguments: LoginBackArgument(
                                            state.email, state.password),
                                      );
                                }
                              },
                              child: const Text('Create')),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
