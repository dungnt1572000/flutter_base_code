import 'dart:async';

import 'package:flutter/services.dart';

class GetBatteryPlugin {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  static const eventPlatform = EventChannel("samples.flutter.dev/event_battery");
  static final GetBatteryPlugin _instance = GetBatteryPlugin._internal();

  factory GetBatteryPlugin() {
    return _instance;
  }

  GetBatteryPlugin._internal();

  GetBatteryPlugin get instance => _instance;

  Future<int> getPin(Map<String,String> argument) async =>
      await platform.invokeMethod('getBatteryLevel',argument);
  Future<Stream> get streamSub async => eventPlatform.receiveBroadcastStream();
}
