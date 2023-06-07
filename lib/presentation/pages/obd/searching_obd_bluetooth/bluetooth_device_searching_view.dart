import 'dart:async';
import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_view.dart';
import 'package:baseproject/presentation/pages/obd/searching_obd_bluetooth/bluetooth_device_searching_view_model.dart';
import 'package:baseproject/presentation/pages/obd/searching_obd_bluetooth/model/devices_bluetooth.dart';
import 'package:baseproject/presentation/resources/app_text_styles.dart';
import 'package:baseproject/presentation/widget/app_bar.dart';
import 'package:baseproject/presentation/widget/app_indicator/app_lading_indicator.dart';
import 'package:baseproject/presentation/widget/app_indicator/app_loading_overlayed.dart';
import 'package:baseproject/ultilities/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bluetooth_device_searching_state.dart';

final _provider = StateNotifierProvider.autoDispose<
    BluetoothDeviceSearchViewModel,
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

  void startScan() async {
    viewModel.loading();
    flutterBluetoothSerial.startDiscovery().listen((device) {
      if (device.device.name != null &&
          !_devicesBluetoothList
              .any((element) => element.name == device.device.name)) {
        _devicesBluetoothList.add(CustomDevicesBluetooth(
            device.device.name ?? 'Unknown', device.device.address));
      }
    });
    await Future.delayed(Duration.zero, () async {
      final result = await flutterBluetoothSerial.getBondedDevices();
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
    viewModel.ending();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flutterBluetoothSerial.cancelDiscovery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          ref.read(appNavigatorProvider).navigateTo(AppRoutes.obdDetail,
              arguments: ObdDetailArgument('abc'));
          // checkBluetooth().then((_) {
          //   startScan();
          // });
          // Future.delayed(const Duration(seconds: 5)).then((_) {
          //   stopScan();
          // });
        },
      ),
      appBar: const BaseAppBar(
          title: Text(
        'Bluetooth Searching',
        style: AppTextStyles.headingMedium,
      )),
      body: AppLoadingOverlay(
        status: state.status,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: state.listDevice.isEmpty &&state.status == LoadingStatus.success
                    ? const Text('0 device is detected')
                    : Column(
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          ...state.listDevice
                              .map(
                                (e) => TextButton(
                                  onPressed: () async {
                                    ref.read(appNavigatorProvider).navigateTo(
                                        AppRoutes.obdDetail,
                                        arguments:
                                            ObdDetailArgument(e.address));
                                  },
                                  child: Text('${e.name} ${e.address}'),
                                ),
                              )
                              .toList()
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
