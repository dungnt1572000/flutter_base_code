import 'package:baseproject/data/model/get_questions_category_response.dart';
import 'package:baseproject/data/repositories/question_repository.dart';
import 'package:baseproject/presentation/domain/use_case/use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';

class GetQuestionCategoryUseCase
    extends FutureOutputUseCase<GetQuestionsCategoryResponse> {
  @override
  Future<GetQuestionsCategoryResponse> run() async {
    return await injector.get<QuestionRepository>().getQuestionsCategory();
  }
}
