import 'package:baseproject/presentation/domain/use_case/set_user_id_use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';
import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/pages/login_group/sign_in/sign_in_state.dart';
import 'package:baseproject/presentation/pages/login_group/sign_in/sign_in_view_model.dart';
import 'package:baseproject/presentation/resources/app_images.dart';
import 'package:baseproject/presentation/resources/app_text_styles.dart';
import 'package:baseproject/presentation/widget/app_button.dart';
import 'package:baseproject/presentation/widget/snack_bar/error_snack_bar.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/use_case/get_user_credential_use_case.dart';
import '../../../widget/app_indicator/app_loading_overlayed.dart';

final _provider =
    StateNotifierProvider.autoDispose<SignInViewModel, SignInState>(
  (ref) => SignInViewModel(
    injector.get<GetUserCredentialUseCase>(),
    injector.get<SaveUserIDUseCase>(),
  ),
);

class SignInView extends ConsumerStatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  final passwordEditingController = TextEditingController();
  final userNameEditingController = TextEditingController();

  SignInState get state => ref.watch(_provider);
  SignInViewModel get viewModel => ref.read(_provider.notifier);

  @override
  Widget build(BuildContext context) {

    ref.listen(_provider, (SignInState? previous,SignInState next) {
      if(previous!.status!=next.status && next.status== LoadingStatus.error){
        showErrorSnackBar(context: context, errorMessage: next.errorMessage);
      }
    });
    return Scaffold(
      body: SafeArea(
        child: AppLoadingOverlay(
          status: state.status,
          child: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AppImages.signInBackgroundImage,
                    )),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppImages.signInIcon),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Login',
                      style: AppTextStyles.headingLargeLight,
                    ),
                    Form(
                        child: Column(
                      children: [
                        TextField(
                          decoration:
                              const InputDecoration(hintText: 'UserName'),
                          controller: userNameEditingController,
                        ),
                        TextField(
                          decoration:
                              const InputDecoration(hintText: 'Password'),
                          controller: passwordEditingController,
                        ),
                      ],
                    )),
                    const SizedBox(
                      height: 48,
                    ),
                    AppButton(
                      title: 'Login',
                      onButtonTap: ()async {
                       final result =  await viewModel.signIn(userNameEditingController.text, passwordEditingController.text);
                       if(!result){
                         ref.read(appNavigatorProvider).navigateTo(AppRoutes.notFound404Error);
                       }else{
                         ref.read(appNavigatorProvider).navigateTo(AppRoutes.home);
                       }
                      },
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
