// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_information_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserInformationStateTearOff {
  const _$UserInformationStateTearOff();

  _UserInformationState call(
      {String errorMassage = '',
      LoadingStatus status = LoadingStatus.initial}) {
    return _UserInformationState(
      errorMassage: errorMassage,
      status: status,
    );
  }
}

/// @nodoc
const $UserInformationState = _$UserInformationStateTearOff();

/// @nodoc
mixin _$UserInformationState {
  String get errorMassage => throw _privateConstructorUsedError;
  LoadingStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserInformationStateCopyWith<UserInformationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInformationStateCopyWith<$Res> {
  factory $UserInformationStateCopyWith(UserInformationState value,
          $Res Function(UserInformationState) then) =
      _$UserInformationStateCopyWithImpl<$Res>;
  $Res call({String errorMassage, LoadingStatus status});
}

/// @nodoc
class _$UserInformationStateCopyWithImpl<$Res>
    implements $UserInformationStateCopyWith<$Res> {
  _$UserInformationStateCopyWithImpl(this._value, this._then);

  final UserInformationState _value;
  // ignore: unused_field
  final $Res Function(UserInformationState) _then;

  @override
  $Res call({
    Object? errorMassage = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      errorMassage: errorMassage == freezed
          ? _value.errorMassage
          : errorMassage // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc
abstract class _$UserInformationStateCopyWith<$Res>
    implements $UserInformationStateCopyWith<$Res> {
  factory _$UserInformationStateCopyWith(_UserInformationState value,
          $Res Function(_UserInformationState) then) =
      __$UserInformationStateCopyWithImpl<$Res>;
  @override
  $Res call({String errorMassage, LoadingStatus status});
}

/// @nodoc
class __$UserInformationStateCopyWithImpl<$Res>
    extends _$UserInformationStateCopyWithImpl<$Res>
    implements _$UserInformationStateCopyWith<$Res> {
  __$UserInformationStateCopyWithImpl(
      _UserInformationState _value, $Res Function(_UserInformationState) _then)
      : super(_value, (v) => _then(v as _UserInformationState));

  @override
  _UserInformationState get _value => super._value as _UserInformationState;

  @override
  $Res call({
    Object? errorMassage = freezed,
    Object? status = freezed,
  }) {
    return _then(_UserInformationState(
      errorMassage: errorMassage == freezed
          ? _value.errorMassage
          : errorMassage // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_UserInformationState implements _UserInformationState {
  _$_UserInformationState(
      {this.errorMassage = '', this.status = LoadingStatus.initial});

  @JsonKey()
  @override
  final String errorMassage;
  @JsonKey()
  @override
  final LoadingStatus status;

  @override
  String toString() {
    return 'UserInformationState(errorMassage: $errorMassage, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserInformationState &&
            const DeepCollectionEquality()
                .equals(other.errorMassage, errorMassage) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(errorMassage),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$UserInformationStateCopyWith<_UserInformationState> get copyWith =>
      __$UserInformationStateCopyWithImpl<_UserInformationState>(
          this, _$identity);
}

abstract class _UserInformationState implements UserInformationState {
  factory _UserInformationState({String errorMassage, LoadingStatus status}) =
      _$_UserInformationState;

  @override
  String get errorMassage;
  @override
  LoadingStatus get status;
  @override
  @JsonKey(ignore: true)
  _$UserInformationStateCopyWith<_UserInformationState> get copyWith =>
      throw _privateConstructorUsedError;
}
