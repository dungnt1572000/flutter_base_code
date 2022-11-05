import 'package:baseproject/data/repositories/entities/searching_object.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState{
  factory HomeState({
    @Default('') String errorMsg,
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default(0) double currentSpeed,
    @Default(10.762622) double latLng,
    @Default(106.660172) double longLng,
    @Default([]) List<LatLng> markers,
    @Default(true) bool isDisplaySearchingBar,
    @Default(false) bool isDisplayDetailIntroduction,
    @Default([]) List<Feature> listSearchingPlace,
  }) = _HomeState;
}