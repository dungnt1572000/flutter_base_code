import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    this.suggestText,
    this.leadingIcon,
    this.subIcon,
    this.textInputAction = TextInputAction.done,
    this.expandable = false,
    this.minLine = 1,
    this.maxLine = 1,
    Key? key,
    this.textFieldKey,
    this.validator,
    this.textEditingController,
    this.isActive = true,
    this.isPassword = false,
    this.maxLength = 30,
  }) : super(key: key);
  final String? suggestText;
  bool? expandable = false;
  final Widget? leadingIcon;
  final Widget? subIcon;
  TextInputAction? textInputAction = TextInputAction.done;
  final int minLine;
  final int maxLine;
  final GlobalKey<FormFieldState>? textFieldKey;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;
  final bool isActive;
  final bool isPassword;
  final int maxLength;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isActive ? 1 : 0.5,
      child: TextFormField(
        validator: widget.validator,
        key: widget.textFieldKey,
        controller: widget.textEditingController,
        enabled: widget.isActive ? true : false,
        maxLines: widget.maxLine,
        minLines: widget.minLine,
        maxLength: widget.maxLength,
      ),
    );
  }
}
