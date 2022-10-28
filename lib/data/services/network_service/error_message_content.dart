import 'package:dio/dio.dart';

extension ErrorMessage on DioError{

  String get getAppErrorContent => getContent();
  String getContent(){
    switch(type){
      case DioErrorType.response:
        final statusError = response?.statusCode?? 500;
        if(statusError == 400){
          return 'Need Authorized';
        }
        break;
      default:
        return 'Unknow code';
    }
    return 'Unknow code';
  }
}