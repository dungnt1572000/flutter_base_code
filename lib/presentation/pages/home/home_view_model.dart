import 'package:baseproject/presentation/pages/home/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class HomeViewModel extends StateNotifier<HomeState>{
  HomeViewModel():super(HomeState());

  void upDateCurrentSpeed(double currentSpeed){
    state = state.copyWith(currentSpeed: currentSpeed);
  }

  void upDateCurrentLocation(double latitude, double longtitude){
    state = state.copyWith(latLng: latitude,longLng: longtitude);
  }
}