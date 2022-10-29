import 'package:baseproject/data/services/network_service/error_message_content.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

extension Error on Exception{
  String get appErrorMsg{
      if(this is DioError){
        final dioError = this as DioError;
        return dioError.getAppErrorContent;
      }
      debugPrint(toString());
      return '';
  }
}