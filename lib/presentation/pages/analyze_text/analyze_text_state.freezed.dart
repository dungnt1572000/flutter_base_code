// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analyze_text_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$AnalyzeTextStateCopyWithImpl<$Res, AnalyzeTextState>;
  @useResult
  $Res call(
      {LoadingStatus status,
      List<TextBlock> listTextBlock,
      List<String> listTranslatedText,
      String translateLanguages});
}

/// @nodoc
class _$AnalyzeTextStateCopyWithImpl<$Res, $Val extends AnalyzeTextState>
    implements $AnalyzeTextStateCopyWith<$Res> {
  _$AnalyzeTextStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? listTextBlock = null,
    Object? listTranslatedText = null,
    Object? translateLanguages = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      listTextBlock: null == listTextBlock
          ? _value.listTextBlock
          : listTextBlock // ignore: cast_nullable_to_non_nullable
              as List<TextBlock>,
      listTranslatedText: null == listTranslatedText
          ? _value.listTranslatedText
          : listTranslatedText // ignore: cast_nullable_to_non_nullable
              as List<String>,
      translateLanguages: null == translateLanguages
          ? _value.translateLanguages
          : translateLanguages // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnalyzeTextStateCopyWith<$Res>
    implements $AnalyzeTextStateCopyWith<$Res> {
  factory _$$_AnalyzeTextStateCopyWith(
          _$_AnalyzeTextState value, $Res Function(_$_AnalyzeTextState) then) =
      __$$_AnalyzeTextStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadingStatus status,
      List<TextBlock> listTextBlock,
      List<String> listTranslatedText,
      String translateLanguages});
}

/// @nodoc
class __$$_AnalyzeTextStateCopyWithImpl<$Res>
    extends _$AnalyzeTextStateCopyWithImpl<$Res, _$_AnalyzeTextState>
    implements _$$_AnalyzeTextStateCopyWith<$Res> {
  __$$_AnalyzeTextStateCopyWithImpl(
      _$_AnalyzeTextState _value, $Res Function(_$_AnalyzeTextState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? listTextBlock = null,
    Object? listTranslatedText = null,
    Object? translateLanguages = null,
  }) {
    return _then(_$_AnalyzeTextState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      listTextBlock: null == listTextBlock
          ? _value._listTextBlock
          : listTextBlock // ignore: cast_nullable_to_non_nullable
              as List<TextBlock>,
      listTranslatedText: null == listTranslatedText
          ? _value._listTranslatedText
          : listTranslatedText // ignore: cast_nullable_to_non_nullable
              as List<String>,
      translateLanguages: null == translateLanguages
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
      final List<TextBlock> listTextBlock = const [],
      final List<String> listTranslatedText = const [],
      this.translateLanguages = 'en'})
      : _listTextBlock = listTextBlock,
        _listTranslatedText = listTranslatedText;

  @override
  @JsonKey()
  final LoadingStatus status;
  final List<TextBlock> _listTextBlock;
  @override
  @JsonKey()
  List<TextBlock> get listTextBlock {
    if (_listTextBlock is EqualUnmodifiableListView) return _listTextBlock;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listTextBlock);
  }

  final List<String> _listTranslatedText;
  @override
  @JsonKey()
  List<String> get listTranslatedText {
    if (_listTranslatedText is EqualUnmodifiableListView)
      return _listTranslatedText;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listTranslatedText);
  }

  @override
  @JsonKey()
  final String translateLanguages;

  @override
  String toString() {
    return 'AnalyzeTextState(status: $status, listTextBlock: $listTextBlock, listTranslatedText: $listTranslatedText, translateLanguages: $translateLanguages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnalyzeTextState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._listTextBlock, _listTextBlock) &&
            const DeepCollectionEquality()
                .equals(other._listTranslatedText, _listTranslatedText) &&
            (identical(other.translateLanguages, translateLanguages) ||
                other.translateLanguages == translateLanguages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_listTextBlock),
      const DeepCollectionEquality().hash(_listTranslatedText),
      translateLanguages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnalyzeTextStateCopyWith<_$_AnalyzeTextState> get copyWith =>
      __$$_AnalyzeTextStateCopyWithImpl<_$_AnalyzeTextState>(this, _$identity);
}

abstract class _AnalyzeTextState implements AnalyzeTextState {
  factory _AnalyzeTextState(
      {final LoadingStatus status,
      final List<TextBlock> listTextBlock,
      final List<String> listTranslatedText,
      final String translateLanguages}) = _$_AnalyzeTextState;

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
  _$$_AnalyzeTextStateCopyWith<_$_AnalyzeTextState> get copyWith =>
      throw _privateConstructorUsedError;
}
