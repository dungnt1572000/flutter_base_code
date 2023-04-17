// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'direction_obj.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DirectionObj _$DirectionObjFromJson(Map<String, dynamic> json) {
  return _DirectionObj.fromJson(json);
}

/// @nodoc
mixin _$DirectionObj {
  List<Routes>? get routes => throw _privateConstructorUsedError;
  List<Waypoints>? get waypoints => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get uuid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DirectionObjCopyWith<DirectionObj> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectionObjCopyWith<$Res> {
  factory $DirectionObjCopyWith(
          DirectionObj value, $Res Function(DirectionObj) then) =
      _$DirectionObjCopyWithImpl<$Res, DirectionObj>;
  @useResult
  $Res call(
      {List<Routes>? routes,
      List<Waypoints>? waypoints,
      String? code,
      String? uuid});
}

/// @nodoc
class _$DirectionObjCopyWithImpl<$Res, $Val extends DirectionObj>
    implements $DirectionObjCopyWith<$Res> {
  _$DirectionObjCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = freezed,
    Object? waypoints = freezed,
    Object? code = freezed,
    Object? uuid = freezed,
  }) {
    return _then(_value.copyWith(
      routes: freezed == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<Routes>?,
      waypoints: freezed == waypoints
          ? _value.waypoints
          : waypoints // ignore: cast_nullable_to_non_nullable
              as List<Waypoints>?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DirectionObjCopyWith<$Res>
    implements $DirectionObjCopyWith<$Res> {
  factory _$$_DirectionObjCopyWith(
          _$_DirectionObj value, $Res Function(_$_DirectionObj) then) =
      __$$_DirectionObjCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Routes>? routes,
      List<Waypoints>? waypoints,
      String? code,
      String? uuid});
}

/// @nodoc
class __$$_DirectionObjCopyWithImpl<$Res>
    extends _$DirectionObjCopyWithImpl<$Res, _$_DirectionObj>
    implements _$$_DirectionObjCopyWith<$Res> {
  __$$_DirectionObjCopyWithImpl(
      _$_DirectionObj _value, $Res Function(_$_DirectionObj) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = freezed,
    Object? waypoints = freezed,
    Object? code = freezed,
    Object? uuid = freezed,
  }) {
    return _then(_$_DirectionObj(
      routes: freezed == routes
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<Routes>?,
      waypoints: freezed == waypoints
          ? _value._waypoints
          : waypoints // ignore: cast_nullable_to_non_nullable
              as List<Waypoints>?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DirectionObj implements _DirectionObj {
  _$_DirectionObj(
      {final List<Routes>? routes,
      final List<Waypoints>? waypoints,
      this.code,
      this.uuid})
      : _routes = routes,
        _waypoints = waypoints;

  factory _$_DirectionObj.fromJson(Map<String, dynamic> json) =>
      _$$_DirectionObjFromJson(json);

  final List<Routes>? _routes;
  @override
  List<Routes>? get routes {
    final value = _routes;
    if (value == null) return null;
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Waypoints>? _waypoints;
  @override
  List<Waypoints>? get waypoints {
    final value = _waypoints;
    if (value == null) return null;
    if (_waypoints is EqualUnmodifiableListView) return _waypoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? code;
  @override
  final String? uuid;

  @override
  String toString() {
    return 'DirectionObj(routes: $routes, waypoints: $waypoints, code: $code, uuid: $uuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DirectionObj &&
            const DeepCollectionEquality().equals(other._routes, _routes) &&
            const DeepCollectionEquality()
                .equals(other._waypoints, _waypoints) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_routes),
      const DeepCollectionEquality().hash(_waypoints),
      code,
      uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DirectionObjCopyWith<_$_DirectionObj> get copyWith =>
      __$$_DirectionObjCopyWithImpl<_$_DirectionObj>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DirectionObjToJson(
      this,
    );
  }
}

abstract class _DirectionObj implements DirectionObj {
  factory _DirectionObj(
      {final List<Routes>? routes,
      final List<Waypoints>? waypoints,
      final String? code,
      final String? uuid}) = _$_DirectionObj;

  factory _DirectionObj.fromJson(Map<String, dynamic> json) =
      _$_DirectionObj.fromJson;

  @override
  List<Routes>? get routes;
  @override
  List<Waypoints>? get waypoints;
  @override
  String? get code;
  @override
  String? get uuid;
  @override
  @JsonKey(ignore: true)
  _$$_DirectionObjCopyWith<_$_DirectionObj> get copyWith =>
      throw _privateConstructorUsedError;
}

Routes _$RoutesFromJson(Map<String, dynamic> json) {
  return _Routes.fromJson(json);
}

/// @nodoc
mixin _$Routes {
  @JsonKey(name: 'country_crossed')
  bool? get countryCrossed => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight_name')
  String? get weightName => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  double? get duration => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  List<Legs>? get legs => throw _privateConstructorUsedError;
  Geometry? get geometry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoutesCopyWith<Routes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutesCopyWith<$Res> {
  factory $RoutesCopyWith(Routes value, $Res Function(Routes) then) =
      _$RoutesCopyWithImpl<$Res, Routes>;
  @useResult
  $Res call(
      {@JsonKey(name: 'country_crossed') bool? countryCrossed,
      @JsonKey(name: 'weight_name') String? weightName,
      double? weight,
      double? duration,
      double? distance,
      List<Legs>? legs,
      Geometry? geometry});

  $GeometryCopyWith<$Res>? get geometry;
}

/// @nodoc
class _$RoutesCopyWithImpl<$Res, $Val extends Routes>
    implements $RoutesCopyWith<$Res> {
  _$RoutesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCrossed = freezed,
    Object? weightName = freezed,
    Object? weight = freezed,
    Object? duration = freezed,
    Object? distance = freezed,
    Object? legs = freezed,
    Object? geometry = freezed,
  }) {
    return _then(_value.copyWith(
      countryCrossed: freezed == countryCrossed
          ? _value.countryCrossed
          : countryCrossed // ignore: cast_nullable_to_non_nullable
              as bool?,
      weightName: freezed == weightName
          ? _value.weightName
          : weightName // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      legs: freezed == legs
          ? _value.legs
          : legs // ignore: cast_nullable_to_non_nullable
              as List<Legs>?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeometryCopyWith<$Res>? get geometry {
    if (_value.geometry == null) {
      return null;
    }

    return $GeometryCopyWith<$Res>(_value.geometry!, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RoutesCopyWith<$Res> implements $RoutesCopyWith<$Res> {
  factory _$$_RoutesCopyWith(_$_Routes value, $Res Function(_$_Routes) then) =
      __$$_RoutesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'country_crossed') bool? countryCrossed,
      @JsonKey(name: 'weight_name') String? weightName,
      double? weight,
      double? duration,
      double? distance,
      List<Legs>? legs,
      Geometry? geometry});

  @override
  $GeometryCopyWith<$Res>? get geometry;
}

/// @nodoc
class __$$_RoutesCopyWithImpl<$Res>
    extends _$RoutesCopyWithImpl<$Res, _$_Routes>
    implements _$$_RoutesCopyWith<$Res> {
  __$$_RoutesCopyWithImpl(_$_Routes _value, $Res Function(_$_Routes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCrossed = freezed,
    Object? weightName = freezed,
    Object? weight = freezed,
    Object? duration = freezed,
    Object? distance = freezed,
    Object? legs = freezed,
    Object? geometry = freezed,
  }) {
    return _then(_$_Routes(
      countryCrossed: freezed == countryCrossed
          ? _value.countryCrossed
          : countryCrossed // ignore: cast_nullable_to_non_nullable
              as bool?,
      weightName: freezed == weightName
          ? _value.weightName
          : weightName // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      legs: freezed == legs
          ? _value._legs
          : legs // ignore: cast_nullable_to_non_nullable
              as List<Legs>?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Routes implements _Routes {
  _$_Routes(
      {@JsonKey(name: 'country_crossed') this.countryCrossed,
      @JsonKey(name: 'weight_name') this.weightName,
      this.weight,
      this.duration,
      this.distance,
      final List<Legs>? legs,
      this.geometry})
      : _legs = legs;

  factory _$_Routes.fromJson(Map<String, dynamic> json) =>
      _$$_RoutesFromJson(json);

  @override
  @JsonKey(name: 'country_crossed')
  final bool? countryCrossed;
  @override
  @JsonKey(name: 'weight_name')
  final String? weightName;
  @override
  final double? weight;
  @override
  final double? duration;
  @override
  final double? distance;
  final List<Legs>? _legs;
  @override
  List<Legs>? get legs {
    final value = _legs;
    if (value == null) return null;
    if (_legs is EqualUnmodifiableListView) return _legs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Geometry? geometry;

  @override
  String toString() {
    return 'Routes(countryCrossed: $countryCrossed, weightName: $weightName, weight: $weight, duration: $duration, distance: $distance, legs: $legs, geometry: $geometry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Routes &&
            (identical(other.countryCrossed, countryCrossed) ||
                other.countryCrossed == countryCrossed) &&
            (identical(other.weightName, weightName) ||
                other.weightName == weightName) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            const DeepCollectionEquality().equals(other._legs, _legs) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      countryCrossed,
      weightName,
      weight,
      duration,
      distance,
      const DeepCollectionEquality().hash(_legs),
      geometry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoutesCopyWith<_$_Routes> get copyWith =>
      __$$_RoutesCopyWithImpl<_$_Routes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoutesToJson(
      this,
    );
  }
}

abstract class _Routes implements Routes {
  factory _Routes(
      {@JsonKey(name: 'country_crossed') final bool? countryCrossed,
      @JsonKey(name: 'weight_name') final String? weightName,
      final double? weight,
      final double? duration,
      final double? distance,
      final List<Legs>? legs,
      final Geometry? geometry}) = _$_Routes;

  factory _Routes.fromJson(Map<String, dynamic> json) = _$_Routes.fromJson;

  @override
  @JsonKey(name: 'country_crossed')
  bool? get countryCrossed;
  @override
  @JsonKey(name: 'weight_name')
  String? get weightName;
  @override
  double? get weight;
  @override
  double? get duration;
  @override
  double? get distance;
  @override
  List<Legs>? get legs;
  @override
  Geometry? get geometry;
  @override
  @JsonKey(ignore: true)
  _$$_RoutesCopyWith<_$_Routes> get copyWith =>
      throw _privateConstructorUsedError;
}

Legs _$LegsFromJson(Map<String, dynamic> json) {
  return _Legs.fromJson(json);
}

/// @nodoc
mixin _$Legs {
  @JsonKey(name: 'via_waypoints')
  List<Waypoints>? get viaWaypoints => throw _privateConstructorUsedError;
  Annotation? get annotation => throw _privateConstructorUsedError;
  List<Admins>? get admins => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  double? get duration => throw _privateConstructorUsedError;
  List<dynamic>? get steps => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LegsCopyWith<Legs> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LegsCopyWith<$Res> {
  factory $LegsCopyWith(Legs value, $Res Function(Legs) then) =
      _$LegsCopyWithImpl<$Res, Legs>;
  @useResult
  $Res call(
      {@JsonKey(name: 'via_waypoints') List<Waypoints>? viaWaypoints,
      Annotation? annotation,
      List<Admins>? admins,
      double? weight,
      double? duration,
      List<dynamic>? steps,
      double? distance,
      String? summary});

  $AnnotationCopyWith<$Res>? get annotation;
}

/// @nodoc
class _$LegsCopyWithImpl<$Res, $Val extends Legs>
    implements $LegsCopyWith<$Res> {
  _$LegsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viaWaypoints = freezed,
    Object? annotation = freezed,
    Object? admins = freezed,
    Object? weight = freezed,
    Object? duration = freezed,
    Object? steps = freezed,
    Object? distance = freezed,
    Object? summary = freezed,
  }) {
    return _then(_value.copyWith(
      viaWaypoints: freezed == viaWaypoints
          ? _value.viaWaypoints
          : viaWaypoints // ignore: cast_nullable_to_non_nullable
              as List<Waypoints>?,
      annotation: freezed == annotation
          ? _value.annotation
          : annotation // ignore: cast_nullable_to_non_nullable
              as Annotation?,
      admins: freezed == admins
          ? _value.admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<Admins>?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnnotationCopyWith<$Res>? get annotation {
    if (_value.annotation == null) {
      return null;
    }

    return $AnnotationCopyWith<$Res>(_value.annotation!, (value) {
      return _then(_value.copyWith(annotation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LegsCopyWith<$Res> implements $LegsCopyWith<$Res> {
  factory _$$_LegsCopyWith(_$_Legs value, $Res Function(_$_Legs) then) =
      __$$_LegsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'via_waypoints') List<Waypoints>? viaWaypoints,
      Annotation? annotation,
      List<Admins>? admins,
      double? weight,
      double? duration,
      List<dynamic>? steps,
      double? distance,
      String? summary});

  @override
  $AnnotationCopyWith<$Res>? get annotation;
}

/// @nodoc
class __$$_LegsCopyWithImpl<$Res> extends _$LegsCopyWithImpl<$Res, _$_Legs>
    implements _$$_LegsCopyWith<$Res> {
  __$$_LegsCopyWithImpl(_$_Legs _value, $Res Function(_$_Legs) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viaWaypoints = freezed,
    Object? annotation = freezed,
    Object? admins = freezed,
    Object? weight = freezed,
    Object? duration = freezed,
    Object? steps = freezed,
    Object? distance = freezed,
    Object? summary = freezed,
  }) {
    return _then(_$_Legs(
      viaWaypoints: freezed == viaWaypoints
          ? _value._viaWaypoints
          : viaWaypoints // ignore: cast_nullable_to_non_nullable
              as List<Waypoints>?,
      annotation: freezed == annotation
          ? _value.annotation
          : annotation // ignore: cast_nullable_to_non_nullable
              as Annotation?,
      admins: freezed == admins
          ? _value._admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<Admins>?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      steps: freezed == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Legs implements _Legs {
  _$_Legs(
      {@JsonKey(name: 'via_waypoints') final List<Waypoints>? viaWaypoints,
      this.annotation,
      final List<Admins>? admins,
      this.weight,
      this.duration,
      final List<dynamic>? steps,
      this.distance,
      this.summary})
      : _viaWaypoints = viaWaypoints,
        _admins = admins,
        _steps = steps;

  factory _$_Legs.fromJson(Map<String, dynamic> json) => _$$_LegsFromJson(json);

  final List<Waypoints>? _viaWaypoints;
  @override
  @JsonKey(name: 'via_waypoints')
  List<Waypoints>? get viaWaypoints {
    final value = _viaWaypoints;
    if (value == null) return null;
    if (_viaWaypoints is EqualUnmodifiableListView) return _viaWaypoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Annotation? annotation;
  final List<Admins>? _admins;
  @override
  List<Admins>? get admins {
    final value = _admins;
    if (value == null) return null;
    if (_admins is EqualUnmodifiableListView) return _admins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? weight;
  @override
  final double? duration;
  final List<dynamic>? _steps;
  @override
  List<dynamic>? get steps {
    final value = _steps;
    if (value == null) return null;
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? distance;
  @override
  final String? summary;

  @override
  String toString() {
    return 'Legs(viaWaypoints: $viaWaypoints, annotation: $annotation, admins: $admins, weight: $weight, duration: $duration, steps: $steps, distance: $distance, summary: $summary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Legs &&
            const DeepCollectionEquality()
                .equals(other._viaWaypoints, _viaWaypoints) &&
            (identical(other.annotation, annotation) ||
                other.annotation == annotation) &&
            const DeepCollectionEquality().equals(other._admins, _admins) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_viaWaypoints),
      annotation,
      const DeepCollectionEquality().hash(_admins),
      weight,
      duration,
      const DeepCollectionEquality().hash(_steps),
      distance,
      summary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LegsCopyWith<_$_Legs> get copyWith =>
      __$$_LegsCopyWithImpl<_$_Legs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LegsToJson(
      this,
    );
  }
}

abstract class _Legs implements Legs {
  factory _Legs(
      {@JsonKey(name: 'via_waypoints') final List<Waypoints>? viaWaypoints,
      final Annotation? annotation,
      final List<Admins>? admins,
      final double? weight,
      final double? duration,
      final List<dynamic>? steps,
      final double? distance,
      final String? summary}) = _$_Legs;

  factory _Legs.fromJson(Map<String, dynamic> json) = _$_Legs.fromJson;

  @override
  @JsonKey(name: 'via_waypoints')
  List<Waypoints>? get viaWaypoints;
  @override
  Annotation? get annotation;
  @override
  List<Admins>? get admins;
  @override
  double? get weight;
  @override
  double? get duration;
  @override
  List<dynamic>? get steps;
  @override
  double? get distance;
  @override
  String? get summary;
  @override
  @JsonKey(ignore: true)
  _$$_LegsCopyWith<_$_Legs> get copyWith => throw _privateConstructorUsedError;
}

Annotation _$AnnotationFromJson(Map<String, dynamic> json) {
  return _Annotation.fromJson(json);
}

/// @nodoc
mixin _$Annotation {
  @JsonKey(name: 'maxspeed')
  List<MaxSpeed>? get maxspeed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnotationCopyWith<Annotation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnotationCopyWith<$Res> {
  factory $AnnotationCopyWith(
          Annotation value, $Res Function(Annotation) then) =
      _$AnnotationCopyWithImpl<$Res, Annotation>;
  @useResult
  $Res call({@JsonKey(name: 'maxspeed') List<MaxSpeed>? maxspeed});
}

/// @nodoc
class _$AnnotationCopyWithImpl<$Res, $Val extends Annotation>
    implements $AnnotationCopyWith<$Res> {
  _$AnnotationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxspeed = freezed,
  }) {
    return _then(_value.copyWith(
      maxspeed: freezed == maxspeed
          ? _value.maxspeed
          : maxspeed // ignore: cast_nullable_to_non_nullable
              as List<MaxSpeed>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnnotationCopyWith<$Res>
    implements $AnnotationCopyWith<$Res> {
  factory _$$_AnnotationCopyWith(
          _$_Annotation value, $Res Function(_$_Annotation) then) =
      __$$_AnnotationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'maxspeed') List<MaxSpeed>? maxspeed});
}

/// @nodoc
class __$$_AnnotationCopyWithImpl<$Res>
    extends _$AnnotationCopyWithImpl<$Res, _$_Annotation>
    implements _$$_AnnotationCopyWith<$Res> {
  __$$_AnnotationCopyWithImpl(
      _$_Annotation _value, $Res Function(_$_Annotation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxspeed = freezed,
  }) {
    return _then(_$_Annotation(
      maxspeed: freezed == maxspeed
          ? _value._maxspeed
          : maxspeed // ignore: cast_nullable_to_non_nullable
              as List<MaxSpeed>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Annotation implements _Annotation {
  _$_Annotation({@JsonKey(name: 'maxspeed') final List<MaxSpeed>? maxspeed})
      : _maxspeed = maxspeed;

  factory _$_Annotation.fromJson(Map<String, dynamic> json) =>
      _$$_AnnotationFromJson(json);

  final List<MaxSpeed>? _maxspeed;
  @override
  @JsonKey(name: 'maxspeed')
  List<MaxSpeed>? get maxspeed {
    final value = _maxspeed;
    if (value == null) return null;
    if (_maxspeed is EqualUnmodifiableListView) return _maxspeed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Annotation(maxspeed: $maxspeed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Annotation &&
            const DeepCollectionEquality().equals(other._maxspeed, _maxspeed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_maxspeed));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnotationCopyWith<_$_Annotation> get copyWith =>
      __$$_AnnotationCopyWithImpl<_$_Annotation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnnotationToJson(
      this,
    );
  }
}

abstract class _Annotation implements Annotation {
  factory _Annotation(
          {@JsonKey(name: 'maxspeed') final List<MaxSpeed>? maxspeed}) =
      _$_Annotation;

  factory _Annotation.fromJson(Map<String, dynamic> json) =
      _$_Annotation.fromJson;

  @override
  @JsonKey(name: 'maxspeed')
  List<MaxSpeed>? get maxspeed;
  @override
  @JsonKey(ignore: true)
  _$$_AnnotationCopyWith<_$_Annotation> get copyWith =>
      throw _privateConstructorUsedError;
}

MaxSpeed _$MaxSpeedFromJson(Map<String, dynamic> json) {
  return _MaxSpeed.fromJson(json);
}

/// @nodoc
mixin _$MaxSpeed {
  bool? get unknown => throw _privateConstructorUsedError;
  int? get speed => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaxSpeedCopyWith<MaxSpeed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaxSpeedCopyWith<$Res> {
  factory $MaxSpeedCopyWith(MaxSpeed value, $Res Function(MaxSpeed) then) =
      _$MaxSpeedCopyWithImpl<$Res, MaxSpeed>;
  @useResult
  $Res call({bool? unknown, int? speed, String? unit});
}

/// @nodoc
class _$MaxSpeedCopyWithImpl<$Res, $Val extends MaxSpeed>
    implements $MaxSpeedCopyWith<$Res> {
  _$MaxSpeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unknown = freezed,
    Object? speed = freezed,
    Object? unit = freezed,
  }) {
    return _then(_value.copyWith(
      unknown: freezed == unknown
          ? _value.unknown
          : unknown // ignore: cast_nullable_to_non_nullable
              as bool?,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaxSpeedCopyWith<$Res> implements $MaxSpeedCopyWith<$Res> {
  factory _$$_MaxSpeedCopyWith(
          _$_MaxSpeed value, $Res Function(_$_MaxSpeed) then) =
      __$$_MaxSpeedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? unknown, int? speed, String? unit});
}

/// @nodoc
class __$$_MaxSpeedCopyWithImpl<$Res>
    extends _$MaxSpeedCopyWithImpl<$Res, _$_MaxSpeed>
    implements _$$_MaxSpeedCopyWith<$Res> {
  __$$_MaxSpeedCopyWithImpl(
      _$_MaxSpeed _value, $Res Function(_$_MaxSpeed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unknown = freezed,
    Object? speed = freezed,
    Object? unit = freezed,
  }) {
    return _then(_$_MaxSpeed(
      unknown: freezed == unknown
          ? _value.unknown
          : unknown // ignore: cast_nullable_to_non_nullable
              as bool?,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MaxSpeed implements _MaxSpeed {
  _$_MaxSpeed({this.unknown, this.speed, this.unit});

  factory _$_MaxSpeed.fromJson(Map<String, dynamic> json) =>
      _$$_MaxSpeedFromJson(json);

  @override
  final bool? unknown;
  @override
  final int? speed;
  @override
  final String? unit;

  @override
  String toString() {
    return 'MaxSpeed(unknown: $unknown, speed: $speed, unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaxSpeed &&
            (identical(other.unknown, unknown) || other.unknown == unknown) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, unknown, speed, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaxSpeedCopyWith<_$_MaxSpeed> get copyWith =>
      __$$_MaxSpeedCopyWithImpl<_$_MaxSpeed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaxSpeedToJson(
      this,
    );
  }
}

abstract class _MaxSpeed implements MaxSpeed {
  factory _MaxSpeed(
      {final bool? unknown,
      final int? speed,
      final String? unit}) = _$_MaxSpeed;

  factory _MaxSpeed.fromJson(Map<String, dynamic> json) = _$_MaxSpeed.fromJson;

  @override
  bool? get unknown;
  @override
  int? get speed;
  @override
  String? get unit;
  @override
  @JsonKey(ignore: true)
  _$$_MaxSpeedCopyWith<_$_MaxSpeed> get copyWith =>
      throw _privateConstructorUsedError;
}

Admins _$AdminsFromJson(Map<String, dynamic> json) {
  return _Admins.fromJson(json);
}

/// @nodoc
mixin _$Admins {
  @JsonKey(name: 'iso_3166_1_alpha3')
  String? get iso31661Alpha3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'iso_3166_1')
  String? get iso31661 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminsCopyWith<Admins> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminsCopyWith<$Res> {
  factory $AdminsCopyWith(Admins value, $Res Function(Admins) then) =
      _$AdminsCopyWithImpl<$Res, Admins>;
  @useResult
  $Res call(
      {@JsonKey(name: 'iso_3166_1_alpha3') String? iso31661Alpha3,
      @JsonKey(name: 'iso_3166_1') String? iso31661});
}

/// @nodoc
class _$AdminsCopyWithImpl<$Res, $Val extends Admins>
    implements $AdminsCopyWith<$Res> {
  _$AdminsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iso31661Alpha3 = freezed,
    Object? iso31661 = freezed,
  }) {
    return _then(_value.copyWith(
      iso31661Alpha3: freezed == iso31661Alpha3
          ? _value.iso31661Alpha3
          : iso31661Alpha3 // ignore: cast_nullable_to_non_nullable
              as String?,
      iso31661: freezed == iso31661
          ? _value.iso31661
          : iso31661 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdminsCopyWith<$Res> implements $AdminsCopyWith<$Res> {
  factory _$$_AdminsCopyWith(_$_Admins value, $Res Function(_$_Admins) then) =
      __$$_AdminsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'iso_3166_1_alpha3') String? iso31661Alpha3,
      @JsonKey(name: 'iso_3166_1') String? iso31661});
}

/// @nodoc
class __$$_AdminsCopyWithImpl<$Res>
    extends _$AdminsCopyWithImpl<$Res, _$_Admins>
    implements _$$_AdminsCopyWith<$Res> {
  __$$_AdminsCopyWithImpl(_$_Admins _value, $Res Function(_$_Admins) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iso31661Alpha3 = freezed,
    Object? iso31661 = freezed,
  }) {
    return _then(_$_Admins(
      iso31661Alpha3: freezed == iso31661Alpha3
          ? _value.iso31661Alpha3
          : iso31661Alpha3 // ignore: cast_nullable_to_non_nullable
              as String?,
      iso31661: freezed == iso31661
          ? _value.iso31661
          : iso31661 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Admins implements _Admins {
  _$_Admins(
      {@JsonKey(name: 'iso_3166_1_alpha3') this.iso31661Alpha3,
      @JsonKey(name: 'iso_3166_1') this.iso31661});

  factory _$_Admins.fromJson(Map<String, dynamic> json) =>
      _$$_AdminsFromJson(json);

  @override
  @JsonKey(name: 'iso_3166_1_alpha3')
  final String? iso31661Alpha3;
  @override
  @JsonKey(name: 'iso_3166_1')
  final String? iso31661;

  @override
  String toString() {
    return 'Admins(iso31661Alpha3: $iso31661Alpha3, iso31661: $iso31661)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Admins &&
            (identical(other.iso31661Alpha3, iso31661Alpha3) ||
                other.iso31661Alpha3 == iso31661Alpha3) &&
            (identical(other.iso31661, iso31661) ||
                other.iso31661 == iso31661));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, iso31661Alpha3, iso31661);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdminsCopyWith<_$_Admins> get copyWith =>
      __$$_AdminsCopyWithImpl<_$_Admins>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdminsToJson(
      this,
    );
  }
}

abstract class _Admins implements Admins {
  factory _Admins(
      {@JsonKey(name: 'iso_3166_1_alpha3') final String? iso31661Alpha3,
      @JsonKey(name: 'iso_3166_1') final String? iso31661}) = _$_Admins;

  factory _Admins.fromJson(Map<String, dynamic> json) = _$_Admins.fromJson;

  @override
  @JsonKey(name: 'iso_3166_1_alpha3')
  String? get iso31661Alpha3;
  @override
  @JsonKey(name: 'iso_3166_1')
  String? get iso31661;
  @override
  @JsonKey(ignore: true)
  _$$_AdminsCopyWith<_$_Admins> get copyWith =>
      throw _privateConstructorUsedError;
}

Geometry _$GeometryFromJson(Map<String, dynamic> json) {
  return _Geometry.fromJson(json);
}

/// @nodoc
mixin _$Geometry {
  List<List<double>>? get coordinates => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeometryCopyWith<Geometry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeometryCopyWith<$Res> {
  factory $GeometryCopyWith(Geometry value, $Res Function(Geometry) then) =
      _$GeometryCopyWithImpl<$Res, Geometry>;
  @useResult
  $Res call({List<List<double>>? coordinates, String? type});
}

/// @nodoc
class _$GeometryCopyWithImpl<$Res, $Val extends Geometry>
    implements $GeometryCopyWith<$Res> {
  _$GeometryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<List<double>>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeometryCopyWith<$Res> implements $GeometryCopyWith<$Res> {
  factory _$$_GeometryCopyWith(
          _$_Geometry value, $Res Function(_$_Geometry) then) =
      __$$_GeometryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<List<double>>? coordinates, String? type});
}

/// @nodoc
class __$$_GeometryCopyWithImpl<$Res>
    extends _$GeometryCopyWithImpl<$Res, _$_Geometry>
    implements _$$_GeometryCopyWith<$Res> {
  __$$_GeometryCopyWithImpl(
      _$_Geometry _value, $Res Function(_$_Geometry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_Geometry(
      coordinates: freezed == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<List<double>>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Geometry implements _Geometry {
  _$_Geometry({final List<List<double>>? coordinates, this.type})
      : _coordinates = coordinates;

  factory _$_Geometry.fromJson(Map<String, dynamic> json) =>
      _$$_GeometryFromJson(json);

  final List<List<double>>? _coordinates;
  @override
  List<List<double>>? get coordinates {
    final value = _coordinates;
    if (value == null) return null;
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? type;

  @override
  String toString() {
    return 'Geometry(coordinates: $coordinates, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Geometry &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_coordinates), type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeometryCopyWith<_$_Geometry> get copyWith =>
      __$$_GeometryCopyWithImpl<_$_Geometry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeometryToJson(
      this,
    );
  }
}

abstract class _Geometry implements Geometry {
  factory _Geometry(
      {final List<List<double>>? coordinates,
      final String? type}) = _$_Geometry;

  factory _Geometry.fromJson(Map<String, dynamic> json) = _$_Geometry.fromJson;

  @override
  List<List<double>>? get coordinates;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$_GeometryCopyWith<_$_Geometry> get copyWith =>
      throw _privateConstructorUsedError;
}

Waypoints _$WaypointsFromJson(Map<String, dynamic> json) {
  return _Waypoints.fromJson(json);
}

/// @nodoc
mixin _$Waypoints {
  double? get distance => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<double>? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WaypointsCopyWith<Waypoints> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaypointsCopyWith<$Res> {
  factory $WaypointsCopyWith(Waypoints value, $Res Function(Waypoints) then) =
      _$WaypointsCopyWithImpl<$Res, Waypoints>;
  @useResult
  $Res call({double? distance, String? name, List<double>? location});
}

/// @nodoc
class _$WaypointsCopyWithImpl<$Res, $Val extends Waypoints>
    implements $WaypointsCopyWith<$Res> {
  _$WaypointsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = freezed,
    Object? name = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WaypointsCopyWith<$Res> implements $WaypointsCopyWith<$Res> {
  factory _$$_WaypointsCopyWith(
          _$_Waypoints value, $Res Function(_$_Waypoints) then) =
      __$$_WaypointsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? distance, String? name, List<double>? location});
}

/// @nodoc
class __$$_WaypointsCopyWithImpl<$Res>
    extends _$WaypointsCopyWithImpl<$Res, _$_Waypoints>
    implements _$$_WaypointsCopyWith<$Res> {
  __$$_WaypointsCopyWithImpl(
      _$_Waypoints _value, $Res Function(_$_Waypoints) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = freezed,
    Object? name = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_Waypoints(
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value._location
          : location // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Waypoints implements _Waypoints {
  _$_Waypoints({this.distance, this.name, final List<double>? location})
      : _location = location;

  factory _$_Waypoints.fromJson(Map<String, dynamic> json) =>
      _$$_WaypointsFromJson(json);

  @override
  final double? distance;
  @override
  final String? name;
  final List<double>? _location;
  @override
  List<double>? get location {
    final value = _location;
    if (value == null) return null;
    if (_location is EqualUnmodifiableListView) return _location;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Waypoints(distance: $distance, name: $name, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Waypoints &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._location, _location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, distance, name,
      const DeepCollectionEquality().hash(_location));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WaypointsCopyWith<_$_Waypoints> get copyWith =>
      __$$_WaypointsCopyWithImpl<_$_Waypoints>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WaypointsToJson(
      this,
    );
  }
}

abstract class _Waypoints implements Waypoints {
  factory _Waypoints(
      {final double? distance,
      final String? name,
      final List<double>? location}) = _$_Waypoints;

  factory _Waypoints.fromJson(Map<String, dynamic> json) =
      _$_Waypoints.fromJson;

  @override
  double? get distance;
  @override
  String? get name;
  @override
  List<double>? get location;
  @override
  @JsonKey(ignore: true)
  _$$_WaypointsCopyWith<_$_Waypoints> get copyWith =>
      throw _privateConstructorUsedError;
}
