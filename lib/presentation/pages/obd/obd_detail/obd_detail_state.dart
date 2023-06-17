import 'package:baseproject/ultilities/app_constant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'obd_detail_state.freezed.dart';

@freezed
class ObdDetailState with _$ObdDetailState{
  factory ObdDetailState({
    @Default(0) double speed,
    @Default(0) double rpm,
    @Default(0) double nhietdodongco,
    @Default(0) double mucnhienlieu,
    @Default(AppConstant.latitude) double latitude,
    @Default(AppConstant.longitude) double longitude,
    @Default('') String telephone,
    @Default(true) bool isSafety,
    @Default(0.0) double distance,
    @Default(0.0) double time,
    @Default([]) List<LatLng> listForPolyLine,
    @Default(false) bool showOptions,
    @Default(true) bool showSpeed,
    @Default(true) bool showTime,
    @Default(true) bool showDistance,
    @Default(true) bool showRpm,
    @Default(true) bool following,
}) = _ObdDetailState;
}