// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'obd_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ObdDetailState {
  double get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ObdDetailStateCopyWith<ObdDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObdDetailStateCopyWith<$Res> {
  factory $ObdDetailStateCopyWith(
          ObdDetailState value, $Res Function(ObdDetailState) then) =
      _$ObdDetailStateCopyWithImpl<$Res, ObdDetailState>;
  @useResult
  $Res call({double value});
}

/// @nodoc
class _$ObdDetailStateCopyWithImpl<$Res, $Val extends ObdDetailState>
    implements $ObdDetailStateCopyWith<$Res> {
  _$ObdDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ObdDetailStateCopyWith<$Res>
    implements $ObdDetailStateCopyWith<$Res> {
  factory _$$_ObdDetailStateCopyWith(
          _$_ObdDetailState value, $Res Function(_$_ObdDetailState) then) =
      __$$_ObdDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double value});
}

/// @nodoc
class __$$_ObdDetailStateCopyWithImpl<$Res>
    extends _$ObdDetailStateCopyWithImpl<$Res, _$_ObdDetailState>
    implements _$$_ObdDetailStateCopyWith<$Res> {
  __$$_ObdDetailStateCopyWithImpl(
      _$_ObdDetailState _value, $Res Function(_$_ObdDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_ObdDetailState(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_ObdDetailState implements _ObdDetailState {
  _$_ObdDetailState({this.value = 0});

  @override
  @JsonKey()
  final double value;

  @override
  String toString() {
    return 'ObdDetailState(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ObdDetailState &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ObdDetailStateCopyWith<_$_ObdDetailState> get copyWith =>
      __$$_ObdDetailStateCopyWithImpl<_$_ObdDetailState>(this, _$identity);
}

abstract class _ObdDetailState implements ObdDetailState {
  factory _ObdDetailState({final double value}) = _$_ObdDetailState;

  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$_ObdDetailStateCopyWith<_$_ObdDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
