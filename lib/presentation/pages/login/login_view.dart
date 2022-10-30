import 'package:baseproject/presentation/domain/use_case/save_access_token_use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';
import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/pages/login/login_state.dart';
import 'package:baseproject/presentation/pages/login/login_view_model.dart';
import 'package:baseproject/presentation/widget/app_indicator/app_loading_overlayed.dart';
import 'package:baseproject/presentation/widget/base_form_mixin.dart';
import 'package:baseproject/presentation/widget/custom_text_form_field.dart';
import 'package:baseproject/presentation/widget/snack_bar/error_snack_bar.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validator/form_validator.dart';

final _provider = StateNotifierProvider.autoDispose<LoginViewModel, LoginState>(
  (ref) => LoginViewModel(injector.get<SaveAccessTokenUseCase>()),
);

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> with BaseFormMixin {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginState get state => ref.watch(_provider);
  LoginViewModel get _viewModel => ref.read(_provider.notifier);

  @override
  Widget buildContent() {
    ref.listen<LoginState>(_provider, ((previous, next) {
      if (next.status == LoadingStatus.error) {
        showErrorSnackBar(context: context, errorMessage: next.errorMessage);
      }
    }));

    return Scaffold(
      body: SafeArea(
          child: AppLoadingOverlay(
        status: state.status,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email'),
                  CustomTextFormField(
                    validator: ValidationBuilder()
                        .required()
                        .email()
                        .minLength(6)
                        .build(),
                    textEditingController: _mailController,
                  ),
                  Text('Password'),
                  CustomTextFormField(
                    validator:
                        ValidationBuilder().required().minLength(6).build(),
                    textEditingController: _passwordController,
                    isPassword: true,
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  validate(
                    onSuccess: () async {
                      final result = await _viewModel.login(
                          _mailController.text.trim(),
                          _passwordController.text.trim());
                      if (result) {
                        ref
                            .read(appNavigatorProvider)
                            .navigateTo(Approutes.home);
                      }
                    },
                  );
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
