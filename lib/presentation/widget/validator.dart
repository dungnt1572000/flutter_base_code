import 'package:form_validator/form_validator.dart';

class CustomValidator extends ValidationBuilder {
  final bool needTrimText;

  CustomValidator({
    this.needTrimText = false,
  }) : super(optional: true);
  static final RegExp passwordRegExp =
      RegExp(r'^[\wｧ-ﾝﾞﾟ!“#$%&()*+,\-./:;<=>?@[\]^_`{|}~]+$');

  static final nickNameRegex = RegExp(
      r'((070|080|090)\d{8})|(わらわ|わやわ|わまわ)|(電話|番号|メール教|メール欲|メール知|メアド教|メアド欲|メアド知|アドレス教|アドレス欲|アドレス知)|([_|＿]+)$');

  static final emailRegExp = RegExp(
      r'^[a-zA-Z0-9_\-+/!%]+(\.[a-zA-Z0-9_\-+/!%]+)*[a-zA-Z0-9_\-+/!%]*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9.-]+)?$');

  static final halfWidthAlphanumericalSymbolRegExp =
      RegExp(r"""^[\w\sｧ-ﾝﾞﾟ!@#$%^&*()-_=+{}|;:'"‘“’”,<.>/?]*$""");

  static final halfwidthRegExp = RegExp('[ｧ-ﾝﾞﾟ]');

  static final hiraganaRegExp = RegExp(r'^[ぁ-ん]+$');

  static final japanPhoneRegExp = RegExp(r'^(070|080|090)\d{8}$');

  static final anyPhoneRegExp = RegExp(r'^0\d{9}$');

  static final foreignPhoneRegExp = RegExp(r'^\+[1-9]\d*$');

  static final postcodeRegExp = RegExp(r'^\d{7}$');
  @override
  ValidationBuilder email([String? message]) {
    final error = message ?? 'Need email in here';
    return add(
      (value) => (value == null || emailRegExp.hasMatch(value)) ? error : null,
    );
  }

  @override
  ValidationBuilder required([String? message]) {
    final error = message ?? 'You have to input here';

    // Handle execute required validation first before other validations
    validations.insert(
      0,
      (value) => (value == null || value.isEmpty) ? error : null,
    );
    return this;
  }

  @override
  ValidationBuilder maxLength(int maxLength, [String? message]) {
    final error = message ?? 'Too Long text';
    return add(
      (value) => (value == null || value.length > maxLength) ? error : null,
    );
  }

  @override
  ValidationBuilder minLength(int minLength, [String? message]) {
    final error = message ?? 'Too Short Text';
    return add(
      (value) => (value == null || value.length < minLength) ? error : null,
    );
  }

  @override
  ValidationBuilder regExp(RegExp regExp, String message) {
    const error = 'We cant relize this';
    return add(
        (value) => value != null && regExp.hasMatch(value) ? error : null);
  }
}

extension ValidatorExtension on ValidationBuilder {
  ValidationBuilder password([String? message]) {
    const error = 'This Password cant acceptable';
    return add(
      (value) => (value == null || CustomValidator.passwordRegExp.hasMatch(value)
          ? error
          : null),
    );
  }
}
