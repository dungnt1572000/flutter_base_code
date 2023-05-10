import 'package:baseproject/presentation/pages/obd/searching_obd_bluetooth/bluetooth_device_searching_state.dart';
import 'package:baseproject/presentation/pages/obd/searching_obd_bluetooth/model/devices_bluetooth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BluetoothDeviceSearchViewModel
    extends StateNotifier<BluetoothDeviceSearchState> {
  BluetoothDeviceSearchViewModel() : super(BluetoothDeviceSearchState());

  void initData(List<CustomDevicesBluetooth> result) {
    state = state.copyWith(
      listDevice: result.toSet(),
    );
  }
}
