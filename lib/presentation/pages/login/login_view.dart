import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/widget/base_form_mixin.dart';
import 'package:baseproject/presentation/widget/custom_text_form_field.dart';
import 'package:baseproject/presentation/widget/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validator/form_validator.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> with BaseFormMixin {
  TextEditingController textEditingController = TextEditingController();
  
  @override
  Widget buildContent() {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            children: [
          CustomTextFormField(
            validator:ValidationBuilder().required().minLength(6).build(),
            ),
           ElevatedButton(
          onPressed: () {
            validate(onSuccess: ()=> ref.read(appNavigatorProvider).navigateTo(Approutes.home));
            // if (_formKey.currentState?.validate() == true ) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(content: Text('Processing Data')),
            //   );
            // }
          },
          child: const Text('Submit'),
            ),
            ],
          ),
        ),
      )),
    );
  }
  // @override
  // Widget build(BuildContext context) {
    
  // }
}
