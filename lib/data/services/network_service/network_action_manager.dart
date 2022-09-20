import 'package:flutter/foundation.dart';

class NetworkActionManager{

  VoidCallback? _navigateTo404NotFound;
  void registerNavigateTo404NotFound( VoidCallback action){
      _navigateTo404NotFound = action;
  }
  void navigateTo404NotFound(){
    _navigateTo404NotFound?.call();
  }
}