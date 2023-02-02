// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'analyze_text_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AnalyzeTextStateTearOff {
  const _$AnalyzeTextStateTearOff();

  _AnalyzeTextState call(
      {String text = '', LoadingStatus status = LoadingStatus.initial}) {
    return _AnalyzeTextState(
      text: text,
      status: status,
    );
  }
}

/// @nodoc
const $AnalyzeTextState = _$AnalyzeTextStateTearOff();

/// @nodoc
mixin _$AnalyzeTextState {
  String get text => throw _privateConstructorUsedError;
  LoadingStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnalyzeTextStateCopyWith<AnalyzeTextState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyzeTextStateCopyWith<$Res> {
  factory $AnalyzeTextStateCopyWith(
          AnalyzeTextState value, $Res Function(AnalyzeTextState) then) =
      _$AnalyzeTextStateCopyWithImpl<$Res>;
  $Res call({String text, LoadingStatus status});
}

/// @nodoc
class _$AnalyzeTextStateCopyWithImpl<$Res>
    implements $AnalyzeTextStateCopyWith<$Res> {
  _$AnalyzeTextStateCopyWithImpl(this._value, this._then);

  final AnalyzeTextState _value;
  // ignore: unused_field
  final $Res Function(AnalyzeTextState) _then;

  @override
  $Res call({
    Object? text = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc
abstract class _$AnalyzeTextStateCopyWith<$Res>
    implements $AnalyzeTextStateCopyWith<$Res> {
  factory _$AnalyzeTextStateCopyWith(
          _AnalyzeTextState value, $Res Function(_AnalyzeTextState) then) =
      __$AnalyzeTextStateCopyWithImpl<$Res>;
  @override
  $Res call({String text, LoadingStatus status});
}

/// @nodoc
class __$AnalyzeTextStateCopyWithImpl<$Res>
    extends _$AnalyzeTextStateCopyWithImpl<$Res>
    implements _$AnalyzeTextStateCopyWith<$Res> {
  __$AnalyzeTextStateCopyWithImpl(
      _AnalyzeTextState _value, $Res Function(_AnalyzeTextState) _then)
      : super(_value, (v) => _then(v as _AnalyzeTextState));

  @override
  _AnalyzeTextState get _value => super._value as _AnalyzeTextState;

  @override
  $Res call({
    Object? text = freezed,
    Object? status = freezed,
  }) {
    return _then(_AnalyzeTextState(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
    ));
  }
}

/// @nodoc

class _$_AnalyzeTextState implements _AnalyzeTextState {
  _$_AnalyzeTextState({this.text = '', this.status = LoadingStatus.initial});

  @JsonKey()
  @override
  final String text;
  @JsonKey()
  @override
  final LoadingStatus status;

  @override
  String toString() {
    return 'AnalyzeTextState(text: $text, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnalyzeTextState &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$AnalyzeTextStateCopyWith<_AnalyzeTextState> get copyWith =>
      __$AnalyzeTextStateCopyWithImpl<_AnalyzeTextState>(this, _$identity);
}

abstract class _AnalyzeTextState implements AnalyzeTextState {
  factory _AnalyzeTextState({String text, LoadingStatus status}) =
      _$_AnalyzeTextState;

  @override
  String get text;
  @override
  LoadingStatus get status;
  @override
  @JsonKey(ignore: true)
  _$AnalyzeTextStateCopyWith<_AnalyzeTextState> get copyWith =>
      throw _privateConstructorUsedError;
}
