import 'package:baseproject/presentation/pages/save_driving/save_driving_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaveDrivingViewModel extends StateNotifier<SaveDrivingState>{
  SaveDrivingViewModel() : super(SaveDrivingState());
  void upDateCurrentSpeed(double speed){
    state= state.copyWith(currentSpeed: speed,isOpenSpeed: true);
  }
}