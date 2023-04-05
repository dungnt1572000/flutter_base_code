// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_questions_category_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetQuestionsCategoryResponse _$GetQuestionsCategoryResponseFromJson(
    Map<String, dynamic> json) {
  return _GetQuestionsCategoryResponse.fromJson(json);
}

/// @nodoc
class _$GetQuestionsCategoryResponseTearOff {
  const _$GetQuestionsCategoryResponseTearOff();

  _GetQuestionsCategoryResponse call(
      {@JsonKey(name: 'trivia_categories')
          List<QuestionsCategories>? categories}) {
    return _GetQuestionsCategoryResponse(
      categories: categories,
    );
  }

  GetQuestionsCategoryResponse fromJson(Map<String, Object?> json) {
    return GetQuestionsCategoryResponse.fromJson(json);
  }
}

/// @nodoc
const $GetQuestionsCategoryResponse = _$GetQuestionsCategoryResponseTearOff();

/// @nodoc
mixin _$GetQuestionsCategoryResponse {
  @JsonKey(name: 'trivia_categories')
  List<QuestionsCategories>? get categories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetQuestionsCategoryResponseCopyWith<GetQuestionsCategoryResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetQuestionsCategoryResponseCopyWith<$Res> {
  factory $GetQuestionsCategoryResponseCopyWith(
          GetQuestionsCategoryResponse value,
          $Res Function(GetQuestionsCategoryResponse) then) =
      _$GetQuestionsCategoryResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'trivia_categories')
          List<QuestionsCategories>? categories});
}

/// @nodoc
class _$GetQuestionsCategoryResponseCopyWithImpl<$Res>
    implements $GetQuestionsCategoryResponseCopyWith<$Res> {
  _$GetQuestionsCategoryResponseCopyWithImpl(this._value, this._then);

  final GetQuestionsCategoryResponse _value;
  // ignore: unused_field
  final $Res Function(GetQuestionsCategoryResponse) _then;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<QuestionsCategories>?,
    ));
  }
}

/// @nodoc
abstract class _$GetQuestionsCategoryResponseCopyWith<$Res>
    implements $GetQuestionsCategoryResponseCopyWith<$Res> {
  factory _$GetQuestionsCategoryResponseCopyWith(
          _GetQuestionsCategoryResponse value,
          $Res Function(_GetQuestionsCategoryResponse) then) =
      __$GetQuestionsCategoryResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'trivia_categories')
          List<QuestionsCategories>? categories});
}

/// @nodoc
class __$GetQuestionsCategoryResponseCopyWithImpl<$Res>
    extends _$GetQuestionsCategoryResponseCopyWithImpl<$Res>
    implements _$GetQuestionsCategoryResponseCopyWith<$Res> {
  __$GetQuestionsCategoryResponseCopyWithImpl(
      _GetQuestionsCategoryResponse _value,
      $Res Function(_GetQuestionsCategoryResponse) _then)
      : super(_value, (v) => _then(v as _GetQuestionsCategoryResponse));

  @override
  _GetQuestionsCategoryResponse get _value =>
      super._value as _GetQuestionsCategoryResponse;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_GetQuestionsCategoryResponse(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<QuestionsCategories>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetQuestionsCategoryResponse implements _GetQuestionsCategoryResponse {
  _$_GetQuestionsCategoryResponse(
      {@JsonKey(name: 'trivia_categories') this.categories});

  factory _$_GetQuestionsCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetQuestionsCategoryResponseFromJson(json);

  @override
  @JsonKey(name: 'trivia_categories')
  final List<QuestionsCategories>? categories;

  @override
  String toString() {
    return 'GetQuestionsCategoryResponse(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetQuestionsCategoryResponse &&
            const DeepCollectionEquality()
                .equals(other.categories, categories));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(categories));

  @JsonKey(ignore: true)
  @override
  _$GetQuestionsCategoryResponseCopyWith<_GetQuestionsCategoryResponse>
      get copyWith => __$GetQuestionsCategoryResponseCopyWithImpl<
          _GetQuestionsCategoryResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetQuestionsCategoryResponseToJson(this);
  }
}

abstract class _GetQuestionsCategoryResponse
    implements GetQuestionsCategoryResponse {
  factory _GetQuestionsCategoryResponse(
          {@JsonKey(name: 'trivia_categories')
              List<QuestionsCategories>? categories}) =
      _$_GetQuestionsCategoryResponse;

  factory _GetQuestionsCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$_GetQuestionsCategoryResponse.fromJson;

  @override
  @JsonKey(name: 'trivia_categories')
  List<QuestionsCategories>? get categories;
  @override
  @JsonKey(ignore: true)
  _$GetQuestionsCategoryResponseCopyWith<_GetQuestionsCategoryResponse>
      get copyWith => throw _privateConstructorUsedError;
}
