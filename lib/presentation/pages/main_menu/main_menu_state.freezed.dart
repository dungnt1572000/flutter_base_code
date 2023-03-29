// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MainMenuStateTearOff {
  const _$MainMenuStateTearOff();

  _MainMenuState call({int currentTab = 0}) {
    return _MainMenuState(
      currentTab: currentTab,
    );
  }
}

/// @nodoc
const $MainMenuState = _$MainMenuStateTearOff();

/// @nodoc
mixin _$MainMenuState {
  int get currentTab => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainMenuStateCopyWith<MainMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainMenuStateCopyWith<$Res> {
  factory $MainMenuStateCopyWith(
          MainMenuState value, $Res Function(MainMenuState) then) =
      _$MainMenuStateCopyWithImpl<$Res>;
  $Res call({int currentTab});
}

/// @nodoc
class _$MainMenuStateCopyWithImpl<$Res>
    implements $MainMenuStateCopyWith<$Res> {
  _$MainMenuStateCopyWithImpl(this._value, this._then);

  final MainMenuState _value;
  // ignore: unused_field
  final $Res Function(MainMenuState) _then;

  @override
  $Res call({
    Object? currentTab = freezed,
  }) {
    return _then(_value.copyWith(
      currentTab: currentTab == freezed
          ? _value.currentTab
          : currentTab // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$MainMenuStateCopyWith<$Res>
    implements $MainMenuStateCopyWith<$Res> {
  factory _$MainMenuStateCopyWith(
          _MainMenuState value, $Res Function(_MainMenuState) then) =
      __$MainMenuStateCopyWithImpl<$Res>;
  @override
  $Res call({int currentTab});
}

/// @nodoc
class __$MainMenuStateCopyWithImpl<$Res>
    extends _$MainMenuStateCopyWithImpl<$Res>
    implements _$MainMenuStateCopyWith<$Res> {
  __$MainMenuStateCopyWithImpl(
      _MainMenuState _value, $Res Function(_MainMenuState) _then)
      : super(_value, (v) => _then(v as _MainMenuState));

  @override
  _MainMenuState get _value => super._value as _MainMenuState;

  @override
  $Res call({
    Object? currentTab = freezed,
  }) {
    return _then(_MainMenuState(
      currentTab: currentTab == freezed
          ? _value.currentTab
          : currentTab // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MainMenuState implements _MainMenuState {
  _$_MainMenuState({this.currentTab = 0});

  @JsonKey()
  @override
  final int currentTab;

  @override
  String toString() {
    return 'MainMenuState(currentTab: $currentTab)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MainMenuState &&
            const DeepCollectionEquality()
                .equals(other.currentTab, currentTab));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(currentTab));

  @JsonKey(ignore: true)
  @override
  _$MainMenuStateCopyWith<_MainMenuState> get copyWith =>
      __$MainMenuStateCopyWithImpl<_MainMenuState>(this, _$identity);
}

abstract class _MainMenuState implements MainMenuState {
  factory _MainMenuState({int currentTab}) = _$_MainMenuState;

  @override
  int get currentTab;
  @override
  @JsonKey(ignore: true)
  _$MainMenuStateCopyWith<_MainMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}
