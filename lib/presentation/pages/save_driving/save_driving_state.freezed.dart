// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'save_driving_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SaveDrivingStateTearOff {
  const _$SaveDrivingStateTearOff();

  _SaveDrivingState call(
      {double currentSpeed = 0.0,
      String errorMessage = '',
      dynamic isOpenSpeed = false}) {
    return _SaveDrivingState(
      currentSpeed: currentSpeed,
      errorMessage: errorMessage,
      isOpenSpeed: isOpenSpeed,
    );
  }
}

/// @nodoc
const $SaveDrivingState = _$SaveDrivingStateTearOff();

/// @nodoc
mixin _$SaveDrivingState {
  double get currentSpeed => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  dynamic get isOpenSpeed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SaveDrivingStateCopyWith<SaveDrivingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveDrivingStateCopyWith<$Res> {
  factory $SaveDrivingStateCopyWith(
          SaveDrivingState value, $Res Function(SaveDrivingState) then) =
      _$SaveDrivingStateCopyWithImpl<$Res>;
  $Res call({double currentSpeed, String errorMessage, dynamic isOpenSpeed});
}

/// @nodoc
class _$SaveDrivingStateCopyWithImpl<$Res>
    implements $SaveDrivingStateCopyWith<$Res> {
  _$SaveDrivingStateCopyWithImpl(this._value, this._then);

  final SaveDrivingState _value;
  // ignore: unused_field
  final $Res Function(SaveDrivingState) _then;

  @override
  $Res call({
    Object? currentSpeed = freezed,
    Object? errorMessage = freezed,
    Object? isOpenSpeed = freezed,
  }) {
    return _then(_value.copyWith(
      currentSpeed: currentSpeed == freezed
          ? _value.currentSpeed
          : currentSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isOpenSpeed: isOpenSpeed == freezed
          ? _value.isOpenSpeed
          : isOpenSpeed // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$SaveDrivingStateCopyWith<$Res>
    implements $SaveDrivingStateCopyWith<$Res> {
  factory _$SaveDrivingStateCopyWith(
          _SaveDrivingState value, $Res Function(_SaveDrivingState) then) =
      __$SaveDrivingStateCopyWithImpl<$Res>;
  @override
  $Res call({double currentSpeed, String errorMessage, dynamic isOpenSpeed});
}

/// @nodoc
class __$SaveDrivingStateCopyWithImpl<$Res>
    extends _$SaveDrivingStateCopyWithImpl<$Res>
    implements _$SaveDrivingStateCopyWith<$Res> {
  __$SaveDrivingStateCopyWithImpl(
      _SaveDrivingState _value, $Res Function(_SaveDrivingState) _then)
      : super(_value, (v) => _then(v as _SaveDrivingState));

  @override
  _SaveDrivingState get _value => super._value as _SaveDrivingState;

  @override
  $Res call({
    Object? currentSpeed = freezed,
    Object? errorMessage = freezed,
    Object? isOpenSpeed = freezed,
  }) {
    return _then(_SaveDrivingState(
      currentSpeed: currentSpeed == freezed
          ? _value.currentSpeed
          : currentSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isOpenSpeed: isOpenSpeed == freezed ? _value.isOpenSpeed : isOpenSpeed,
    ));
  }
}

/// @nodoc

class _$_SaveDrivingState implements _SaveDrivingState {
  _$_SaveDrivingState(
      {this.currentSpeed = 0.0,
      this.errorMessage = '',
      this.isOpenSpeed = false});

  @JsonKey()
  @override
  final double currentSpeed;
  @JsonKey()
  @override
  final String errorMessage;
  @JsonKey()
  @override
  final dynamic isOpenSpeed;

  @override
  String toString() {
    return 'SaveDrivingState(currentSpeed: $currentSpeed, errorMessage: $errorMessage, isOpenSpeed: $isOpenSpeed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveDrivingState &&
            const DeepCollectionEquality()
                .equals(other.currentSpeed, currentSpeed) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage) &&
            const DeepCollectionEquality()
                .equals(other.isOpenSpeed, isOpenSpeed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentSpeed),
      const DeepCollectionEquality().hash(errorMessage),
      const DeepCollectionEquality().hash(isOpenSpeed));

  @JsonKey(ignore: true)
  @override
  _$SaveDrivingStateCopyWith<_SaveDrivingState> get copyWith =>
      __$SaveDrivingStateCopyWithImpl<_SaveDrivingState>(this, _$identity);
}

abstract class _SaveDrivingState implements SaveDrivingState {
  factory _SaveDrivingState(
      {double currentSpeed,
      String errorMessage,
      dynamic isOpenSpeed}) = _$_SaveDrivingState;

  @override
  double get currentSpeed;
  @override
  String get errorMessage;
  @override
  dynamic get isOpenSpeed;
  @override
  @JsonKey(ignore: true)
  _$SaveDrivingStateCopyWith<_SaveDrivingState> get copyWith =>
      throw _privateConstructorUsedError;
}
