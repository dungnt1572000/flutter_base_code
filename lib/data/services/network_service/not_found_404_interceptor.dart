import 'package:baseproject/data/services/network_service/network_action_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class NotFound404Interceptor extends QueuedInterceptorsWrapper{
  NotFound404Interceptor(this.networkActionManager);
  final NetworkActionManager networkActionManager;
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(err.message);
    if(err.response?.statusCode ==404){
      handler.reject(err);
      networkActionManager.navigateTo404NotFound();
    }
    handler.next(err);
  }
}