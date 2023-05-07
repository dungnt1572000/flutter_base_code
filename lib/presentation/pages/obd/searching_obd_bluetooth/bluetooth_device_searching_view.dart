import 'dart:async';

import 'package:baseproject/method_chanel/get_battery_plugin.dart';
import 'package:baseproject/presentation/pages/obd/searching_obd_bluetooth/bluetooth_device_searching_view_model.dart';
import 'package:baseproject/presentation/pages/obd/searching_obd_bluetooth/model/devices_bluetooth.dart';
import 'package:baseproject/presentation/resources/app_text_styles.dart';
import 'package:baseproject/presentation/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bluetooth_device_searching_state.dart';

final _provider = StateNotifierProvider<BluetoothDeviceSearchViewModel,
    BluetoothDeviceSearchState>((ref) => BluetoothDeviceSearchViewModel());

class BluetoothDeviceSearchView extends ConsumerStatefulWidget {
  const BluetoothDeviceSearchView({Key? key}) : super(key: key);

  @override
  ConsumerState<BluetoothDeviceSearchView> createState() =>
      _BluetoothDeviceSearchViewState();
}

class _BluetoothDeviceSearchViewState
    extends ConsumerState<BluetoothDeviceSearchView> {
  FlutterBluetoothSerial flutterBluetoothSerial =
      FlutterBluetoothSerial.instance;

  final List<BluetoothDiscoveryResult> _devicesList = [];

  final List<DevicesBluetooth> _devicesBluetoothList = [];

  late final List<BluetoothDevice> _devices = [];

  BluetoothDeviceSearchState get state => ref.watch(_provider);

  BluetoothDeviceSearchViewModel get viewModel => ref.read(_provider.notifier);

  late BluetoothConnection connection;

  GetBatteryPlugin getBatteryPlugin = GetBatteryPlugin().instance;

  String pin = 'unknown';

// late StreamSubscription<String> streamSubscription;
  StreamController controller = StreamController();

  Future _getBatteryLevel() async {
    try {
      final int result = await getBatteryPlugin.getPin({"increment":"12"});
      setState(() {
        pin = '$result %';
      });
    } on PlatformException catch (e) {
      pin = "Failed to get battery level: '${e.message}'.";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkBluetooth().then((_) {
      startScan();
    });
    Future.delayed(const Duration(seconds: 5)).then((_) {
      stopScan();
    });
    getBatteryPlugin.streamSub.then((value) => value.listen((event) {
          setState(() {
            pin = event.toString();
          });
        }));
  }

  // Check if Bluetooth is available
  Future checkBluetooth() async {
    bool? isEnabled = await flutterBluetoothSerial.isEnabled ?? false;
    if (!isEnabled) {
      await flutterBluetoothSerial.requestEnable();
    }
  }

  void startScan() {
    flutterBluetoothSerial.startDiscovery().listen((device) {
      if (device.device.name != null &&
          !_devicesList
              .any((element) => element.device.name == device.device.name)) {
        print(
            'deviceName: ${device.device.name},  address:${device.device.address}');
        _devicesBluetoothList.add(DevicesBluetooth(
            device.device.name ?? 'Unknown', device.device.address));
      }
    });
    Future.delayed(Duration.zero, () async {
      final result = await flutterBluetoothSerial.getBondedDevices();
      print('Soluong: ${result.length}');
      if (result.isNotEmpty) {
        for (int i = 0; i < result.length; i++) {
          _devicesBluetoothList.add(
              DevicesBluetooth(result[i].name ?? 'Unknown', result[i].address));
        }
      }
    });
  }

  // Stop scanning for Bluetooth devices
  void stopScan() {
    flutterBluetoothSerial.cancelDiscovery();
    viewModel.initData(_devicesBluetoothList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          _getBatteryLevel();
        },
      ),
      appBar: const BaseAppBar(
          title: Text(
        'Bluetooth Searching',
        style: AppTextStyles.headingMedium,
      )),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('Click to OBD device Name'),
            const SizedBox(
              height: 12,
            ),
            Text('%pin =: ${pin}')
          ],
        ),
      )),
    );
  }
}
