import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:baseproject/presentation/resources/app_text_styles.dart';
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
  final int? maxLength;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  var isEmty = true;
  late final GlobalKey<FormFieldState> _textFieldKey;
  late final TextEditingController _textEditingController;
  var obscureText = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textFieldKey = widget.textFieldKey ?? GlobalKey<FormFieldState>();
    _textEditingController =
        widget.textEditingController ?? TextEditingController();
    if (widget.isPassword) {
      obscureText = true;
    }
  }

  String? get _errorMessage {
    return _textFieldKey.currentState?.errorText;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isActive ? 1 : 0.5,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            decoration: BoxDecoration(
              color: context.colors.action,
              border: _errorMessage != null
                  ? Border.all(color: context.colors.error, width: 1)
                  : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    // color: Colors.amber,
                    child: TextFormField(
                      validator: widget.validator,
                      key: _textFieldKey,
                      controller: _textEditingController,
                      enabled: widget.isActive ? true : false,
                      maxLines: widget.maxLine,
                      minLines: widget.minLine,
                      // maxLength: widget.maxLength,
                      obscureText: obscureText,
                      onChanged: (value) {
                        setState(() {
                          isEmty = value.isEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.suggestText,
                        hintStyle: AppTextStyles.textMedium.copyWith(
                          color: context.colors.textSecondary,
                        ),
                        hintMaxLines: 1,
                        errorStyle: const TextStyle(
                          height: 0.01,
                          color: Colors.transparent,
                        ),
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                if (!isEmty) _buildClearIconView(context),
                if (widget.isPassword) _buildPasswordToggleView(context),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (_errorMessage != null)
                Expanded(child: _buildError(context, _errorMessage!))
              else if (widget.suggestText != null && _errorMessage == null)
                Expanded(child: _buildSuggestText(context,widget.suggestText??''))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildClearIconView(BuildContext context) {
    return GestureDetector(
        onTap: isEmty
            ? null
            : () {
                setState(() {
                  _textEditingController.clear();
                  isEmty = true;
                });
                _textFieldKey.currentState?.validate();
              },
        child: Icon(
          Icons.cancel,
          color: context.colors.iconSecondary,
          size: 24,
        ));
  }

  Widget _buildPasswordToggleView(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: obscureText
            ? const Icon(
                Icons.visibility_off,
                size: 24,
              )
            : const Icon(
                Icons.visibility,
                size: 24,
              ));
  }

  Widget _buildError(BuildContext context, String errorText) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Text(
        errorText,
        style: AppTextStyles.textSmall.copyWith(color: context.colors.error),
      ),
    );
  }

  Widget _buildSuggestText(BuildContext context, String s) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Text(
        s,
        style: AppTextStyles.textSmall.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
    );
  }
}
