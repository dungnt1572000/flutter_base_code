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
  }) = _HomeState;
}