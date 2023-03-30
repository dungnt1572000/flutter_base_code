import 'package:form_validator/form_validator.dart';

typedef GetCompareText = String Function();

extension ValidatorExtension on ValidationBuilder{
  ValidationBuilder matchString(
      GetCompareText compareText, [
        String? message,
      ]){
    final error =
        message ?? 'Not match';

    return add(
          (value) => (value != null && value != compareText()) ? error : null,
    );
  }
}