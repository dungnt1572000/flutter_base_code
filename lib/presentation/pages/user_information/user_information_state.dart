import 'package:baseproject/ultilities/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_information_state.freezed.dart';

@freezed
class UserInformationState with _$UserInformationState{
  factory UserInformationState({
    @Default('') String errorMassage,
    @Default(LoadingStatus.initial) LoadingStatus status,

}) = _UserInformationState;
}