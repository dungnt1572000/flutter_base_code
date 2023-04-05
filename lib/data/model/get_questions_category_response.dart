
import 'package:baseproject/data/model/questions_categories.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_questions_category_response.freezed.dart';
part 'get_questions_category_response.g.dart';
@freezed
class GetQuestionsCategoryResponse with _$GetQuestionsCategoryResponse{
  factory GetQuestionsCategoryResponse({
    @JsonKey(name: 'trivia_categories') List<QuestionsCategories>? categories
}) = _GetQuestionsCategoryResponse;

  factory GetQuestionsCategoryResponse.fromJson(Map<String, Object?> json)
  => _$GetQuestionsCategoryResponseFromJson(json);
}