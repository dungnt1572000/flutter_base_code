import 'package:baseproject/ultilities/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState{
  factory NotificationState({
    @Default('') String errorMessage,
    @Default(LoadingStatus.initial) LoadingStatus status,
}) = _NotificationState;
}