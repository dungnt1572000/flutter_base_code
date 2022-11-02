// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call(
      {String errorMsg = '',
      LoadingStatus status = LoadingStatus.initial,
      double currentSpeed = 0,
      double latLng = 10.762622,
      double longLng = 106.660172}) {
    return _HomeState(
      errorMsg: errorMsg,
      status: status,
      currentSpeed: currentSpeed,
      latLng: latLng,
      longLng: longLng,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  String get errorMsg => throw _privateConstructorUsedError;
  LoadingStatus get status => throw _privateConstructorUsedError;
  double get currentSpeed => throw _privateConstructorUsedError;
  double get latLng => throw _privateConstructorUsedError;
  double get longLng => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {String errorMsg,
      LoadingStatus status,
      double currentSpeed,
      double latLng,
      double longLng});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? errorMsg = freezed,
    Object? status = freezed,
    Object? currentSpeed = freezed,
    Object? latLng = freezed,
    Object? longLng = freezed,
  }) {
    return _then(_value.copyWith(
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      currentSpeed: currentSpeed == freezed
          ? _value.currentSpeed
          : currentSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      latLng: latLng == freezed
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as double,
      longLng: longLng == freezed
          ? _value.longLng
          : longLng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String errorMsg,
      LoadingStatus status,
      double currentSpeed,
      double latLng,
      double longLng});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object? errorMsg = freezed,
    Object? status = freezed,
    Object? currentSpeed = freezed,
    Object? latLng = freezed,
    Object? longLng = freezed,
  }) {
    return _then(_HomeState(
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      currentSpeed: currentSpeed == freezed
          ? _value.currentSpeed
          : currentSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      latLng: latLng == freezed
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as double,
      longLng: longLng == freezed
          ? _value.longLng
          : longLng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  _$_HomeState(
      {this.errorMsg = '',
      this.status = LoadingStatus.initial,
      this.currentSpeed = 0,
      this.latLng = 10.762622,
      this.longLng = 106.660172});

  @JsonKey()
  @override
  final String errorMsg;
  @JsonKey()
  @override
  final LoadingStatus status;
  @JsonKey()
  @override
  final double currentSpeed;
  @JsonKey()
  @override
  final double latLng;
  @JsonKey()
  @override
  final double longLng;

  @override
  String toString() {
    return 'HomeState(errorMsg: $errorMsg, status: $status, currentSpeed: $currentSpeed, latLng: $latLng, longLng: $longLng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            const DeepCollectionEquality().equals(other.errorMsg, errorMsg) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.currentSpeed, currentSpeed) &&
            const DeepCollectionEquality().equals(other.latLng, latLng) &&
            const DeepCollectionEquality().equals(other.longLng, longLng));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(errorMsg),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(currentSpeed),
      const DeepCollectionEquality().hash(latLng),
      const DeepCollectionEquality().hash(longLng));

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {String errorMsg,
      LoadingStatus status,
      double currentSpeed,
      double latLng,
      double longLng}) = _$_HomeState;

  @override
  String get errorMsg;
  @override
  LoadingStatus get status;
  @override
  double get currentSpeed;
  @override
  double get latLng;
  @override
  double get longLng;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
