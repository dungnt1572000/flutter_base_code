import 'package:freezed_annotation/freezed_annotation.dart';
part 'direction_obj.freezed.dart';
part 'direction_obj.g.dart';

@freezed
class DirectionObj with _$DirectionObj {
  factory DirectionObj({
    List<Routes>? routes,
    List<Waypoints>? waypoints,
    String? code,
    String? uuid,
  }) = _DirectionObj;

  factory DirectionObj.fromJson(Map<String, dynamic> json) =>
      _$DirectionObjFromJson(json);
}

@freezed
class Routes with _$Routes {
  factory Routes({
    @JsonKey(name: 'country_crossed') bool? countryCrossed,
    @JsonKey(name: 'weight_name') String? weightName,
    double? weight,
    double? duration,
    double? distance,
    List<Legs>? legs,
    Geometry? geometry,
  }) = _Routes;

  factory Routes.fromJson(Map<String, dynamic> json) => _$RoutesFromJson(json);
}

@freezed
class Legs with _$Legs {
  factory Legs({
    @JsonKey(name: 'via_waypoints') List<Waypoints>? viaWaypoints,
    Annotation? annotation,
    List<Admins>? admins,
    double? weight,
    double? duration,
    List<dynamic>? steps,
    double? distance,
    String? summary,
  }) = _Legs;

  factory Legs.fromJson(Map<String, dynamic> json) => _$LegsFromJson(json);
}

@freezed
class Annotation with _$Annotation {
  factory Annotation({
    @JsonKey(name: 'maxspeed') List<MaxSpeed>? maxspeed,
  }) = _Annotation;

  factory Annotation.fromJson(Map<String, dynamic> json) =>
      _$AnnotationFromJson(json);
}

@freezed
class MaxSpeed with _$MaxSpeed {
  factory MaxSpeed({
    bool? unknown,
    int? speed,

    String? unit,
  }) = _MaxSpeed;

  factory MaxSpeed.fromJson(Map<String, dynamic> json) =>
      _$MaxSpeedFromJson(json);
}

@freezed
class Admins with _$Admins {
  factory Admins({
    @JsonKey(name: 'iso_3166_1_alpha3') String? iso31661Alpha3,
    @JsonKey(name: 'iso_3166_1') String? iso31661,
  }) = _Admins;

  factory Admins.fromJson(Map<String, dynamic> json) => _$AdminsFromJson(json);
}

@freezed
class Geometry with _$Geometry {
  factory Geometry({
    List<List<double>>? coordinates,
    String? type,
  }) = _Geometry;

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
}

@freezed
class Waypoints with _$Waypoints {
  factory Waypoints({
    double? distance,
    String? name,
    List<double>? location,
  }) = _Waypoints;

  factory Waypoints.fromJson(Map<String, dynamic> json) =>
      _$WaypointsFromJson(json);
}
