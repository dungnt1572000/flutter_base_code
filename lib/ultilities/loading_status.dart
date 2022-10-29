import 'package:baseproject/presentation/widget/app_button.dart';

enum LoadingStatus{
  initial,
  inProgress,
  error,
  success,
}

extension LoadingStatusFunction on LoadingStatus {
  ButtonState get buttonState {
    switch (this) {
      case LoadingStatus.initial:
      case LoadingStatus.success:
      case LoadingStatus.error:
        return ButtonState.normal;
      case LoadingStatus.inProgress:
        return ButtonState.loading;
    }
  }
}