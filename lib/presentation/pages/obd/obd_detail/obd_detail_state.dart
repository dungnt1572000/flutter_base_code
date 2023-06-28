import 'package:baseproject/ultilities/app_constant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'obd_detail_state.freezed.dart';

@freezed
class ObdDetailState with _$ObdDetailState{
  factory ObdDetailState({
    @Default(0) double speed,
    @Default(0) double rpm,
    @Default(AppConstant.latitude) double currentLatitude,
    @Default(AppConstant.longitude) double currentLongitude,
    @Default(AppConstant.latitude) double simulatorLatitude,
    @Default(AppConstant.longitude) double simulatorLongitude,
    @Default('') String telephone,
    @Default(true) bool isSafety,
    @Default(0.0) double distance,
    @Default(0.0) double time,
    @Default(0.0) double fuelConsumption,
    @Default([]) List<LatLng> listForPolyLine,
    @Default(false) bool showOptions,
    @Default(true) bool showSpeed,
    @Default(true) bool showTime,
    @Default(true) bool showDistance,
    @Default(true) bool showRpm,
    @Default(true) bool showFuelConsumption,
    @Default(true) bool following,
    @Default('') String errorMessage,
}) = _ObdDetailState;
}