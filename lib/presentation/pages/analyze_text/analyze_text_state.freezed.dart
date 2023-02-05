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
      {LoadingStatus status = LoadingStatus.inProgress,
      List<TextBlock> listTextBlock = const [],
      List<String> listTranslatedText = const [],
      String translateLanguages = 'en'}) {
    return _AnalyzeTextState(
      status: status,
      listTextBlock: listTextBlock,
      listTranslatedText: listTranslatedText,
      translateLanguages: translateLanguages,
    );
  }
}

/// @nodoc
const $AnalyzeTextState = _$AnalyzeTextStateTearOff();

/// @nodoc
mixin _$AnalyzeTextState {
  LoadingStatus get status => throw _privateConstructorUsedError;
  List<TextBlock> get listTextBlock => throw _privateConstructorUsedError;
  List<String> get listTranslatedText => throw _privateConstructorUsedError;
  String get translateLanguages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnalyzeTextStateCopyWith<AnalyzeTextState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyzeTextStateCopyWith<$Res> {
  factory $AnalyzeTextStateCopyWith(
          AnalyzeTextState value, $Res Function(AnalyzeTextState) then) =
      _$AnalyzeTextStateCopyWithImpl<$Res>;
  $Res call(
      {LoadingStatus status,
      List<TextBlock> listTextBlock,
      List<String> listTranslatedText,
      String translateLanguages});
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
    Object? status = freezed,
    Object? listTextBlock = freezed,
    Object? listTranslatedText = freezed,
    Object? translateLanguages = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      listTextBlock: listTextBlock == freezed
          ? _value.listTextBlock
          : listTextBlock // ignore: cast_nullable_to_non_nullable
              as List<TextBlock>,
      listTranslatedText: listTranslatedText == freezed
          ? _value.listTranslatedText
          : listTranslatedText // ignore: cast_nullable_to_non_nullable
              as List<String>,
      translateLanguages: translateLanguages == freezed
          ? _value.translateLanguages
          : translateLanguages // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call(
      {LoadingStatus status,
      List<TextBlock> listTextBlock,
      List<String> listTranslatedText,
      String translateLanguages});
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
    Object? status = freezed,
    Object? listTextBlock = freezed,
    Object? listTranslatedText = freezed,
    Object? translateLanguages = freezed,
  }) {
    return _then(_AnalyzeTextState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      listTextBlock: listTextBlock == freezed
          ? _value.listTextBlock
          : listTextBlock // ignore: cast_nullable_to_non_nullable
              as List<TextBlock>,
      listTranslatedText: listTranslatedText == freezed
          ? _value.listTranslatedText
          : listTranslatedText // ignore: cast_nullable_to_non_nullable
              as List<String>,
      translateLanguages: translateLanguages == freezed
          ? _value.translateLanguages
          : translateLanguages // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AnalyzeTextState implements _AnalyzeTextState {
  _$_AnalyzeTextState(
      {this.status = LoadingStatus.inProgress,
      this.listTextBlock = const [],
      this.listTranslatedText = const [],
      this.translateLanguages = 'en'});

  @JsonKey()
  @override
  final LoadingStatus status;
  @JsonKey()
  @override
  final List<TextBlock> listTextBlock;
  @JsonKey()
  @override
  final List<String> listTranslatedText;
  @JsonKey()
  @override
  final String translateLanguages;

  @override
  String toString() {
    return 'AnalyzeTextState(status: $status, listTextBlock: $listTextBlock, listTranslatedText: $listTranslatedText, translateLanguages: $translateLanguages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnalyzeTextState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.listTextBlock, listTextBlock) &&
            const DeepCollectionEquality()
                .equals(other.listTranslatedText, listTranslatedText) &&
            const DeepCollectionEquality()
                .equals(other.translateLanguages, translateLanguages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(listTextBlock),
      const DeepCollectionEquality().hash(listTranslatedText),
      const DeepCollectionEquality().hash(translateLanguages));

  @JsonKey(ignore: true)
  @override
  _$AnalyzeTextStateCopyWith<_AnalyzeTextState> get copyWith =>
      __$AnalyzeTextStateCopyWithImpl<_AnalyzeTextState>(this, _$identity);
}

abstract class _AnalyzeTextState implements AnalyzeTextState {
  factory _AnalyzeTextState(
      {LoadingStatus status,
      List<TextBlock> listTextBlock,
      List<String> listTranslatedText,
      String translateLanguages}) = _$_AnalyzeTextState;

  @override
  LoadingStatus get status;
  @override
  List<TextBlock> get listTextBlock;
  @override
  List<String> get listTranslatedText;
  @override
  String get translateLanguages;
  @override
  @JsonKey(ignore: true)
  _$AnalyzeTextStateCopyWith<_AnalyzeTextState> get copyWith =>
      throw _privateConstructorUsedError;
}
