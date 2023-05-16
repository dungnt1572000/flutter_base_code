import 'package:baseproject/presentation/pages/obd/searching_obd_bluetooth/model/devices_bluetooth.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bluetooth_device_searching_state.freezed.dart';

@freezed
class BluetoothDeviceSearchState with _$BluetoothDeviceSearchState{
  factory BluetoothDeviceSearchState({
    @Default({}) Set<CustomDevicesBluetooth> listDevice,
    @Default(LoadingStatus.initial) LoadingStatus status,
}) = _BluetoothDeviceSearch;
}