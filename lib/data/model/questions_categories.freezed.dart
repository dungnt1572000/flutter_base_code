// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'questions_categories.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionsCategories _$QuestionsCategoriesFromJson(Map<String, dynamic> json) {
  return _QuestionsCategories.fromJson(json);
}

/// @nodoc
class _$QuestionsCategoriesTearOff {
  const _$QuestionsCategoriesTearOff();

  _QuestionsCategories call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? categoryName}) {
    return _QuestionsCategories(
      id: id,
      categoryName: categoryName,
    );
  }

  QuestionsCategories fromJson(Map<String, Object?> json) {
    return QuestionsCategories.fromJson(json);
  }
}

/// @nodoc
const $QuestionsCategories = _$QuestionsCategoriesTearOff();

/// @nodoc
mixin _$QuestionsCategories {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get categoryName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionsCategoriesCopyWith<QuestionsCategories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionsCategoriesCopyWith<$Res> {
  factory $QuestionsCategoriesCopyWith(
          QuestionsCategories value, $Res Function(QuestionsCategories) then) =
      _$QuestionsCategoriesCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? categoryName});
}

/// @nodoc
class _$QuestionsCategoriesCopyWithImpl<$Res>
    implements $QuestionsCategoriesCopyWith<$Res> {
  _$QuestionsCategoriesCopyWithImpl(this._value, this._then);

  final QuestionsCategories _value;
  // ignore: unused_field
  final $Res Function(QuestionsCategories) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$QuestionsCategoriesCopyWith<$Res>
    implements $QuestionsCategoriesCopyWith<$Res> {
  factory _$QuestionsCategoriesCopyWith(_QuestionsCategories value,
          $Res Function(_QuestionsCategories) then) =
      __$QuestionsCategoriesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? categoryName});
}

/// @nodoc
class __$QuestionsCategoriesCopyWithImpl<$Res>
    extends _$QuestionsCategoriesCopyWithImpl<$Res>
    implements _$QuestionsCategoriesCopyWith<$Res> {
  __$QuestionsCategoriesCopyWithImpl(
      _QuestionsCategories _value, $Res Function(_QuestionsCategories) _then)
      : super(_value, (v) => _then(v as _QuestionsCategories));

  @override
  _QuestionsCategories get _value => super._value as _QuestionsCategories;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryName = freezed,
  }) {
    return _then(_QuestionsCategories(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionsCategories implements _QuestionsCategories {
  _$_QuestionsCategories(
      {@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.categoryName});

  factory _$_QuestionsCategories.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionsCategoriesFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? categoryName;

  @override
  String toString() {
    return 'QuestionsCategories(id: $id, categoryName: $categoryName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuestionsCategories &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.categoryName, categoryName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(categoryName));

  @JsonKey(ignore: true)
  @override
  _$QuestionsCategoriesCopyWith<_QuestionsCategories> get copyWith =>
      __$QuestionsCategoriesCopyWithImpl<_QuestionsCategories>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionsCategoriesToJson(this);
  }
}

abstract class _QuestionsCategories implements QuestionsCategories {
  factory _QuestionsCategories(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? categoryName}) = _$_QuestionsCategories;

  factory _QuestionsCategories.fromJson(Map<String, dynamic> json) =
      _$_QuestionsCategories.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get categoryName;
  @override
  @JsonKey(ignore: true)
  _$QuestionsCategoriesCopyWith<_QuestionsCategories> get copyWith =>
      throw _privateConstructorUsedError;
}
