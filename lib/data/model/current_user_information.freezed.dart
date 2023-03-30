// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'current_user_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CurrentUserInformationTearOff {
  const _$CurrentUserInformationTearOff();

  _CurrentUserInformation call(
      {String email = '', int age = 0, int star = 0, int postCount = 0}) {
    return _CurrentUserInformation(
      email: email,
      age: age,
      star: star,
      postCount: postCount,
    );
  }
}

/// @nodoc
const $CurrentUserInformation = _$CurrentUserInformationTearOff();

/// @nodoc
mixin _$CurrentUserInformation {
  String get email => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  int get star => throw _privateConstructorUsedError;
  int get postCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentUserInformationCopyWith<CurrentUserInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentUserInformationCopyWith<$Res> {
  factory $CurrentUserInformationCopyWith(CurrentUserInformation value,
          $Res Function(CurrentUserInformation) then) =
      _$CurrentUserInformationCopyWithImpl<$Res>;
  $Res call({String email, int age, int star, int postCount});
}

/// @nodoc
class _$CurrentUserInformationCopyWithImpl<$Res>
    implements $CurrentUserInformationCopyWith<$Res> {
  _$CurrentUserInformationCopyWithImpl(this._value, this._then);

  final CurrentUserInformation _value;
  // ignore: unused_field
  final $Res Function(CurrentUserInformation) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? age = freezed,
    Object? star = freezed,
    Object? postCount = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      star: star == freezed
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int,
      postCount: postCount == freezed
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CurrentUserInformationCopyWith<$Res>
    implements $CurrentUserInformationCopyWith<$Res> {
  factory _$CurrentUserInformationCopyWith(_CurrentUserInformation value,
          $Res Function(_CurrentUserInformation) then) =
      __$CurrentUserInformationCopyWithImpl<$Res>;
  @override
  $Res call({String email, int age, int star, int postCount});
}

/// @nodoc
class __$CurrentUserInformationCopyWithImpl<$Res>
    extends _$CurrentUserInformationCopyWithImpl<$Res>
    implements _$CurrentUserInformationCopyWith<$Res> {
  __$CurrentUserInformationCopyWithImpl(_CurrentUserInformation _value,
      $Res Function(_CurrentUserInformation) _then)
      : super(_value, (v) => _then(v as _CurrentUserInformation));

  @override
  _CurrentUserInformation get _value => super._value as _CurrentUserInformation;

  @override
  $Res call({
    Object? email = freezed,
    Object? age = freezed,
    Object? star = freezed,
    Object? postCount = freezed,
  }) {
    return _then(_CurrentUserInformation(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      star: star == freezed
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int,
      postCount: postCount == freezed
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CurrentUserInformation extends _CurrentUserInformation {
  _$_CurrentUserInformation(
      {this.email = '', this.age = 0, this.star = 0, this.postCount = 0})
      : super._();

  @JsonKey()
  @override
  final String email;
  @JsonKey()
  @override
  final int age;
  @JsonKey()
  @override
  final int star;
  @JsonKey()
  @override
  final int postCount;

  @override
  String toString() {
    return 'CurrentUserInformation(email: $email, age: $age, star: $star, postCount: $postCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurrentUserInformation &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality().equals(other.star, star) &&
            const DeepCollectionEquality().equals(other.postCount, postCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(age),
      const DeepCollectionEquality().hash(star),
      const DeepCollectionEquality().hash(postCount));

  @JsonKey(ignore: true)
  @override
  _$CurrentUserInformationCopyWith<_CurrentUserInformation> get copyWith =>
      __$CurrentUserInformationCopyWithImpl<_CurrentUserInformation>(
          this, _$identity);
}

abstract class _CurrentUserInformation extends CurrentUserInformation {
  factory _CurrentUserInformation(
      {String email,
      int age,
      int star,
      int postCount}) = _$_CurrentUserInformation;
  _CurrentUserInformation._() : super._();

  @override
  String get email;
  @override
  int get age;
  @override
  int get star;
  @override
  int get postCount;
  @override
  @JsonKey(ignore: true)
  _$CurrentUserInformationCopyWith<_CurrentUserInformation> get copyWith =>
      throw _privateConstructorUsedError;
}
