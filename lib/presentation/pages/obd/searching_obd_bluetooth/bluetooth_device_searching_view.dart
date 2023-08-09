import 'dart:async';
import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/navigation/app_routes.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_view.dart';
import 'package:baseproject/presentation/pages/obd/searching_obd_bluetooth/bluetooth_device_searching_view_model.dart';
import 'package:baseproject/presentation/pages/obd/searching_obd_bluetooth/model/devices_bluetooth.dart';
import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:baseproject/presentation/resources/app_text_styles.dart';
import 'package:baseproject/presentation/widget/app_dialog.dart';
import 'package:baseproject/presentation/widget/app_indicator/app_loading_overlayed.dart';
import 'package:baseproject/presentation/widget/gradient_divider.dart';
import 'package:baseproject/presentation/widget/snack_bar/infor_snack_bar.dart';
import 'package:baseproject/ultilities/app_constant.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      await checkBluetooth();
    });
  }

  // Check if Bluetooth is available
  Future checkBluetooth() async {
    bool? isEnabled = await flutterBluetoothSerial.isEnabled ?? false;
    if (!isEnabled) {
      final check = await flutterBluetoothSerial.requestEnable() ?? false;
      if (check) {
        startScan();
      } else {
        if (mounted) {
          showInforSnackBar(
              context: context, message: "please access buetooth");
        }
      }
    } else {
      startScan();
    }
  }

  void startScan() {
    viewModel.loading();
    flutterBluetoothSerial.startDiscovery().listen((device) {
      if (device.device.name != null &&
          !_devicesBluetoothList
              .any((element) => element.name == device.device.name)) {
        _devicesBluetoothList.add(CustomDevicesBluetooth(
            device.device.name ?? 'Unknown', device.device.address));
      }
    });
    Future.delayed(Duration.zero, () async {
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
    Future.delayed(const Duration(seconds: 5)).then((_) {
      stopScan();
    });
  }

  // Stop scanning for Bluetooth devices
  void stopScan() {
    flutterBluetoothSerial.cancelDiscovery();
    viewModel.initData([..._devicesBluetoothList]);
    viewModel.ending();
  }

  @override
  void dispose() {
    flutterBluetoothSerial.cancelDiscovery();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.colors.backdropSecondary,
        child: Icon(
          Icons.refresh,
          color: context.colors.primaryMain,
        ),
        onPressed: () {
          checkBluetooth().then((_) {
            startScan();
          });
          Future.delayed(const Duration(seconds: 5)).then((_) {
            stopScan();
          });
        },
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: BoxDecoration(
            color: context.colors.action,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: context.colors.primaryMain.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: context.colors.primaryMain,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Bluetooth Searching',
              style: AppTextStyles.labelLarge
                  .copyWith(color: context.colors.primaryMain),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.info_outline,
                  color: context.colors.primaryMain,
                ),
                onPressed: () {
                  showInstructionDialog(
                      context, AppConstant.bluetoothSearching);
                },
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: AppLoadingOverlay(
          status: state.status,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: state.listDevice.isEmpty &&
                          state.status == LoadingStatus.success
                      ? Text('0 device is detected',
                          style: AppTextStyles.labelSmall
                              .copyWith(color: context.colors.primaryMain))
                      : Column(
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            ...state.listDevice
                                .map(
                                  (e) => Column(
                                    children: [
                                      TextButton(
                                        onPressed: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  // Adjust the radius as per your preference
                                                  side: BorderSide(
                                                    color: context
                                                        .colors.primaryMain,
                                                    // Border color
                                                    width: 1.5, // Border width
                                                  ),
                                                ),
                                                content: Text(
                                                  'Continue with Simulator Mode',
                                                  style: AppTextStyles
                                                      .labelLargeLight
                                                      .copyWith(
                                                          color: context.colors
                                                              .primaryMain),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      ref
                                                          .read(
                                                              appNavigatorProvider)
                                                          .navigateTo(
                                                              AppRoutes
                                                                  .obdDetail,
                                                              arguments:
                                                                  ObdDetailArgument(
                                                                e.address,
                                                                true,
                                                              ));
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor: context
                                                          .colors.surface,
                                                      shape: RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              color: context
                                                                  .colors
                                                                  .primaryMain),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                    ),
                                                    child: Text("OK",
                                                        style: AppTextStyles
                                                            .labelSmallLight
                                                            .copyWith(
                                                                color: context
                                                                    .colors
                                                                    .primaryMain)),
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        ref
                                                            .read(
                                                                appNavigatorProvider)
                                                            .navigateTo(
                                                                AppRoutes
                                                                    .obdDetail,
                                                                arguments:
                                                                    ObdDetailArgument(
                                                                        e.address,
                                                                        false));
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor: context
                                                            .colors.surface,
                                                        shape: RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: context
                                                                    .colors
                                                                    .primaryMain),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                      ),
                                                      child: Text("NO",
                                                          style: AppTextStyles
                                                              .labelSmallLight
                                                              .copyWith(
                                                                  color: context
                                                                      .colors
                                                                      .primaryMain))),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          '${e.name} ${e.address}',
                                          style: AppTextStyles.labelSmall
                                              .copyWith(
                                                  color: context
                                                      .colors.primaryMain),
                                        ),
                                      ),
                                      const GradientColorDivider()
                                    ],
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
      ),
    );
  }
}
