import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/pages/obd/searching_obd_bluetooth/bluetooth_device_searching_view_model.dart';
import 'package:baseproject/presentation/pages/obd/searching_obd_bluetooth/model/devices_bluetooth.dart';
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

  final List<CustomDevicesBluetooth> _devicesBluetoothList = [];

  BluetoothDeviceSearchState get state => ref.watch(_provider);

  BluetoothDeviceSearchViewModel get viewModel => ref.read(_provider.notifier);

  late BluetoothConnection connection;

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
      if (device.device.name != null
      &&
          !_devicesBluetoothList
              .any((element) => element.name == device.device.name)
      )
      {
        print(
            'deviceName: ${device.device.name},  address:${device.device.address}');
        _devicesBluetoothList.add(CustomDevicesBluetooth(
            device.device.name ?? 'Unknown', device.device.address));
      }
    });
    Future.delayed(Duration.zero, () async {
      final result = await flutterBluetoothSerial.getBondedDevices();
      print('Soluong: ${result.length}');
      if (result.isNotEmpty) {
        for (int i = 0; i < result.length; i++) {
          if (!_devicesBluetoothList
              .any((element) => element.name == result[i].name)) {
            _devicesBluetoothList.add(CustomDevicesBluetooth(
                result[i].name ?? 'Unknown', result[i].address));
          }
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
          checkBluetooth().then((_) {
            startScan();
          });
          Future.delayed(const Duration(seconds: 5)).then((_) {
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
          child: SingleChildScrollView(
            child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
              const Text('Click to OBD device Name'),
              const SizedBox(
                height: 12,
              ),
              ...state.listDevice
                  .map((e) => TextButton(
                      onPressed: () async{
                        // Some simplest connection :F
                        try {
                          BluetoothConnection connection = await BluetoothConnection.toAddress(e.address);
                          print('Connected to the device');

                          connection.input?.listen((Uint8List data) {
                            print('Data incoming: ${ascii.decode(data)}');
                            connection.output.add(data); // Sending data

                            if (ascii.decode(data).contains('!')) {
                              connection.finish(); // Closing connection
                              print('Disconnecting by local host');
                            }
                          }).onDone(() {
                            print('Disconnected by remote request');
                          });
                        }
                        catch (exception) {
                          print('Cannot connect, exception occured');
                        }
                      }, child: Text('${e.name} ${e.address}')))
                  .toList()
            ],
        ),
      ),
          )),
    );
  }
}
