import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/get_questions_category_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://opentdb.com/')
abstract class ApiClient{
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('api_category.php')
  Future<GetQuestionsCategoryResponse> getCategories();
}