import 'package:flutter/material.dart';

mixin BaseFormMixin<T extends StatefulWidget> on State<T> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: buildContent(),
    );
  }

  Widget buildContent();

  void validate({required VoidCallback onSuccess, VoidCallback? onFailure}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          if (_formKey.currentState?.validate() == true) {
            onSuccess();
          } else {
            onFailure?.call();
          }
        });
      }
    });
  }
}
