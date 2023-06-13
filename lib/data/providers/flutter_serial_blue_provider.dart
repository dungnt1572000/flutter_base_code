import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final flutterSerialBlueProvider =
    Provider<FlutterBluetoothSerial>((ref) => FlutterBluetoothSerial.instance);
