import 'package:baseproject/config/app_config.dart';
import 'package:baseproject/presentation/domain/use_case/save_access_token_use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';
import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/pages/login/login_state.dart';
import 'package:baseproject/presentation/pages/login/login_view_model.dart';
import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:baseproject/presentation/resources/app_images.dart';
import 'package:baseproject/presentation/resources/app_text_styles.dart';
import 'package:baseproject/presentation/widget/app_bar.dart';
import 'package:baseproject/presentation/widget/app_button.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: BasicAppBar.onlyTitle(
        title: Text(
          'Login',
          style: AppTextStyles.headingMediumLight
              .copyWith(color: context.colors.action),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: AppLoadingOverlay(
        status: state.status,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildBackgroundImage(),
            _buildBackgroundBlur(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 85),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLoginForm(context),
                  const SizedBox(
                    height: 24,
                  ),
                  _buildButtonLogin(context),
                  const SizedBox(
                    height: 40,
                  ),
                  _buildForgetPassword(context),
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    AppConfig.appDescription,
                    style: AppTextStyles.textLargeBold.copyWith(
                      color: context.colors.textContrastOnContrastBackground,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      AppImages.loginBg,
      fit: BoxFit.cover,
    );
  }

  _buildBackgroundBlur(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.75),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _buildButtonLogin(BuildContext context) {
    return AppButton(
      title: 'Login',
      buttonSize: ButtonSize.medium,
      textAlign: TextAlign.center,
      isExpanded: true,
      onButtonTap: () {
        validate(
          onSuccess: () async {
            final result = await _viewModel.login(
                _mailController.text.trim(), _passwordController.text.trim());
            if (result) {
              ref.read(appNavigatorProvider).navigateTo(Approutes.home);
            }
          },
        );
      },
    );
  }

  Widget _buildForgetPassword(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint('WAAOO');
      },
      child: Text(
        'Forgot password ?',
        style: AppTextStyles.labelLargeLight.copyWith(
          color: context.colors.textContrastOnContrastBackground,
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: AppTextStyles.headingSmallLight.copyWith(
            color: context.colors.textContrastOnContrastBackground,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          validator:
              ValidationBuilder().required().email().minLength(6).build(),
          textEditingController: _mailController,
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          'Password',
          style: AppTextStyles.headingSmallLight.copyWith(
            color: context.colors.textContrastOnContrastBackground,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          validator: ValidationBuilder().required().minLength(6).build(),
          textEditingController: _passwordController,
          isPassword: true,
        )
      ],
    );
  }
}
