// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DirectionObj _$$_DirectionObjFromJson(Map<String, dynamic> json) =>
    _$_DirectionObj(
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => Routes.fromJson(e as Map<String, dynamic>))
          .toList(),
      waypoints: (json['waypoints'] as List<dynamic>?)
          ?.map((e) => Waypoints.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String?,
      uuid: json['uuid'] as String?,
    );

Map<String, dynamic> _$$_DirectionObjToJson(_$_DirectionObj instance) =>
    <String, dynamic>{
      'routes': instance.routes,
      'waypoints': instance.waypoints,
      'code': instance.code,
      'uuid': instance.uuid,
    };

_$_Routes _$$_RoutesFromJson(Map<String, dynamic> json) => _$_Routes(
      countryCrossed: json['country_crossed'] as bool?,
      weightName: json['weight_name'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      legs: (json['legs'] as List<dynamic>?)
          ?.map((e) => Legs.fromJson(e as Map<String, dynamic>))
          .toList(),
      geometry: json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RoutesToJson(_$_Routes instance) => <String, dynamic>{
      'country_crossed': instance.countryCrossed,
      'weight_name': instance.weightName,
      'weight': instance.weight,
      'duration': instance.duration,
      'distance': instance.distance,
      'legs': instance.legs,
      'geometry': instance.geometry,
    };

_$_Legs _$$_LegsFromJson(Map<String, dynamic> json) => _$_Legs(
      viaWaypoints: (json['via_waypoints'] as List<dynamic>?)
          ?.map((e) => Waypoints.fromJson(e as Map<String, dynamic>))
          .toList(),
      annotation: json['annotation'] == null
          ? null
          : Annotation.fromJson(json['annotation'] as Map<String, dynamic>),
      admins: (json['admins'] as List<dynamic>?)
          ?.map((e) => Admins.fromJson(e as Map<String, dynamic>))
          .toList(),
      weight: (json['weight'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toDouble(),
      steps: json['steps'] as List<dynamic>?,
      distance: (json['distance'] as num?)?.toDouble(),
      summary: json['summary'] as String?,
    );

Map<String, dynamic> _$$_LegsToJson(_$_Legs instance) => <String, dynamic>{
      'via_waypoints': instance.viaWaypoints,
      'annotation': instance.annotation,
      'admins': instance.admins,
      'weight': instance.weight,
      'duration': instance.duration,
      'steps': instance.steps,
      'distance': instance.distance,
      'summary': instance.summary,
    };

_$_Annotation _$$_AnnotationFromJson(Map<String, dynamic> json) =>
    _$_Annotation(
      maxspeed: (json['maxspeed'] as List<dynamic>?)
          ?.map((e) => MaxSpeed.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AnnotationToJson(_$_Annotation instance) =>
    <String, dynamic>{
      'maxspeed': instance.maxspeed,
    };

_$_MaxSpeed _$$_MaxSpeedFromJson(Map<String, dynamic> json) => _$_MaxSpeed(
      unknown: json['unknown'] as bool?,
      speed: json['speed'] as int?,
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$$_MaxSpeedToJson(_$_MaxSpeed instance) =>
    <String, dynamic>{
      'unknown': instance.unknown,
      'speed': instance.speed,
      'unit': instance.unit,
    };

_$_Admins _$$_AdminsFromJson(Map<String, dynamic> json) => _$_Admins(
      iso31661Alpha3: json['iso_3166_1_alpha3'] as String?,
      iso31661: json['iso_3166_1'] as String?,
    );

Map<String, dynamic> _$$_AdminsToJson(_$_Admins instance) => <String, dynamic>{
      'iso_3166_1_alpha3': instance.iso31661Alpha3,
      'iso_3166_1': instance.iso31661,
    };

_$_Geometry _$$_GeometryFromJson(Map<String, dynamic> json) => _$_Geometry(
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$_GeometryToJson(_$_Geometry instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
      'type': instance.type,
    };

_$_Waypoints _$$_WaypointsFromJson(Map<String, dynamic> json) => _$_Waypoints(
      distance: (json['distance'] as num?)?.toDouble(),
      name: json['name'] as String?,
      location: (json['location'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$_WaypointsToJson(_$_Waypoints instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'name': instance.name,
      'location': instance.location,
    };
