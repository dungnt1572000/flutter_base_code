import 'dart:convert';
import 'dart:typed_data';

import 'package:baseproject/presentation/pages/obd/searching_obd_bluetooth/bluetooth_device_searching_view_model.dart';
import 'package:baseproject/presentation/resources/app_text_styles.dart';
import 'package:baseproject/presentation/widget/app_bar.dart';
import 'package:flutter/material.dart';
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

  final List<BluetoothDevice> _devices = [];

  BluetoothDeviceSearchState get state => ref.watch(_provider);

  BluetoothDeviceSearchViewModel get viewModel => ref.read(_provider.notifier);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkBluetooth().then((_) {
      startScan();
    });
    Future.delayed(const Duration(seconds: 5)).then((_) {
      viewModel.initData(_devicesList);
      stopScan();
    });
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
      if (device.device.name != null && !_devicesList.any((element) => element.device.name==device.device.name)) {
        _devicesList.add(device);
      }
    });
  }

  // Stop scanning for Bluetooth devices
  void stopScan() {
    flutterBluetoothSerial.cancelDiscovery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          checkBluetooth().then((_) {
            startScan();
          });
          Future.delayed(const Duration(seconds: 5)).then((_) async {
            try {
               FlutterBluetoothSerial.instance.getBondedDevices().then((value) => _devices.addAll(value));
            } catch (ex) {
              print("Không thể lấy danh sách thiết bị: $ex");
            }
            viewModel.initData(_devicesList);
            stopScan();
          });
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
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: state.listDevice.length,
                itemBuilder: (context, index) => TextButton(
                    onPressed: () async{
                      BluetoothDevice device = BluetoothDevice(address: state.listDevice.toList()[index].device.address);
                      BluetoothConnection connection = await BluetoothConnection.toAddress(state.listDevice.toList()[index].device.address);
                      if(connection.isConnected){
                        print('Connected to the device: ${device.name} (${device.address})');
                        String data = 'Hello, world!';
                        Uint8List uint8List = Uint8List.fromList((data + "\r\n").codeUnits);
                        connection.output.add(uint8List);
                        await connection.output.allSent;
                        await connection.close();
                      }
                    },
                    child:
                        Text(state.listDevice.toList()[index].device.name ?? 'Unknown')),
              ),
            )
          ],
        ),
      )),
    );
  }
}
