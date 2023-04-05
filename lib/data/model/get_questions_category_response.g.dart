// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_questions_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetQuestionsCategoryResponse _$$_GetQuestionsCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    _$_GetQuestionsCategoryResponse(
      categories: (json['trivia_categories'] as List<dynamic>?)
          ?.map((e) => QuestionsCategories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GetQuestionsCategoryResponseToJson(
        _$_GetQuestionsCategoryResponse instance) =>
    <String, dynamic>{
      'trivia_categories': instance.categories,
    };
