import 'package:baseproject/data/model/get_questions_category_response.dart';
import 'package:baseproject/data/services/network_service/api_client.dart';

class QuestionRepository{
  QuestionRepository(this.apiClient);
  final ApiClient apiClient;

  Future<GetQuestionsCategoryResponse> getQuestionsCategory() async{
    return await apiClient.getCategories();
  }
}