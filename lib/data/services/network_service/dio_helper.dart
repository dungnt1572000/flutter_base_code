import 'package:baseproject/data/services/network_service/not_found_404_interceptor.dart';
import 'package:dio/dio.dart';

abstract class DioHelper{
  static Dio configDio({
   required NotFound404Interceptor notFound404Interceptor,
  }) => _createDio(
    opstions: BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
    interceptor: [
      notFound404Interceptor,
    ]
  );

  static Dio _createDio({required BaseOptions opstions, List<Interceptor>? interceptor}){
    final dio = Dio();
    dio.options = opstions;
    if(interceptor!=null && interceptor.isNotEmpty){
      dio.interceptors.addAll([...interceptor]);
    }

    return dio;
  }
}