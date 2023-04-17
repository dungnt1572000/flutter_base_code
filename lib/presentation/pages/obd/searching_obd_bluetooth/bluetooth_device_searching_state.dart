import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bluetooth_device_searching_state.freezed.dart';

@freezed
class BluetoothDeviceSearchState with _$BluetoothDeviceSearchState{
  factory BluetoothDeviceSearchState({
    @Default({}) Set<BluetoothDiscoveryResult> listDevice,
}) = _BluetoothDeviceSearch;
}