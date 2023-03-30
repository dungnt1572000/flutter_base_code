import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_user_information.freezed.dart';

@freezed
class CurrentUserInformation with _$CurrentUserInformation {
  factory CurrentUserInformation({
    @Default('') String email,
    @Default(0) int age,
    @Default(0) int star,
    @Default(0) int postCount,
  }) = _CurrentUserInformation;

  const CurrentUserInformation._();
}
