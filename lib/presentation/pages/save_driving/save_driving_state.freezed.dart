// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_driving_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SaveDrivingState {
  double get currentSpeed => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  bool get isOpenSpeed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SaveDrivingStateCopyWith<SaveDrivingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveDrivingStateCopyWith<$Res> {
  factory $SaveDrivingStateCopyWith(
          SaveDrivingState value, $Res Function(SaveDrivingState) then) =
      _$SaveDrivingStateCopyWithImpl<$Res, SaveDrivingState>;
  @useResult
  $Res call({double currentSpeed, String errorMessage, bool isOpenSpeed});
}

/// @nodoc
class _$SaveDrivingStateCopyWithImpl<$Res, $Val extends SaveDrivingState>
    implements $SaveDrivingStateCopyWith<$Res> {
  _$SaveDrivingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentSpeed = null,
    Object? errorMessage = null,
    Object? isOpenSpeed = null,
  }) {
    return _then(_value.copyWith(
      currentSpeed: null == currentSpeed
          ? _value.currentSpeed
          : currentSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isOpenSpeed: null == isOpenSpeed
          ? _value.isOpenSpeed
          : isOpenSpeed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SaveDrivingStateCopyWith<$Res>
    implements $SaveDrivingStateCopyWith<$Res> {
  factory _$$_SaveDrivingStateCopyWith(
          _$_SaveDrivingState value, $Res Function(_$_SaveDrivingState) then) =
      __$$_SaveDrivingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double currentSpeed, String errorMessage, bool isOpenSpeed});
}

/// @nodoc
class __$$_SaveDrivingStateCopyWithImpl<$Res>
    extends _$SaveDrivingStateCopyWithImpl<$Res, _$_SaveDrivingState>
    implements _$$_SaveDrivingStateCopyWith<$Res> {
  __$$_SaveDrivingStateCopyWithImpl(
      _$_SaveDrivingState _value, $Res Function(_$_SaveDrivingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentSpeed = null,
    Object? errorMessage = null,
    Object? isOpenSpeed = null,
  }) {
    return _then(_$_SaveDrivingState(
      currentSpeed: null == currentSpeed
          ? _value.currentSpeed
          : currentSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isOpenSpeed: null == isOpenSpeed
          ? _value.isOpenSpeed
          : isOpenSpeed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SaveDrivingState implements _SaveDrivingState {
  _$_SaveDrivingState(
      {this.currentSpeed = 0.0,
      this.errorMessage = '',
      this.isOpenSpeed = false});

  @override
  @JsonKey()
  final double currentSpeed;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final bool isOpenSpeed;

  @override
  String toString() {
    return 'SaveDrivingState(currentSpeed: $currentSpeed, errorMessage: $errorMessage, isOpenSpeed: $isOpenSpeed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaveDrivingState &&
            (identical(other.currentSpeed, currentSpeed) ||
                other.currentSpeed == currentSpeed) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isOpenSpeed, isOpenSpeed) ||
                other.isOpenSpeed == isOpenSpeed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentSpeed, errorMessage, isOpenSpeed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaveDrivingStateCopyWith<_$_SaveDrivingState> get copyWith =>
      __$$_SaveDrivingStateCopyWithImpl<_$_SaveDrivingState>(this, _$identity);
}

abstract class _SaveDrivingState implements SaveDrivingState {
  factory _SaveDrivingState(
      {final double currentSpeed,
      final String errorMessage,
      final bool isOpenSpeed}) = _$_SaveDrivingState;

  @override
  double get currentSpeed;
  @override
  String get errorMessage;
  @override
  bool get isOpenSpeed;
  @override
  @JsonKey(ignore: true)
  _$$_SaveDrivingStateCopyWith<_$_SaveDrivingState> get copyWith =>
      throw _privateConstructorUsedError;
}
