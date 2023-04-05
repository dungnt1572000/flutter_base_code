
import 'package:freezed_annotation/freezed_annotation.dart';
part 'questions_categories.freezed.dart';
part 'questions_categories.g.dart';
@freezed
class QuestionsCategories with _$QuestionsCategories{
  factory QuestionsCategories({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? categoryName,
}) = _QuestionsCategories;

  factory QuestionsCategories.fromJson(Map<String, Object?> json)
  => _$QuestionsCategoriesFromJson(json);
}