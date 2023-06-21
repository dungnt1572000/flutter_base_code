import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:baseproject/data/providers/destination_provider.dart';
import 'package:baseproject/data/providers/flutter_serial_blue_provider.dart';
import 'package:baseproject/presentation/domain/use_case/get_show_distance_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/get_show_duration_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/get_show_fuel_consumption_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/get_show_rpm_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/get_show_speed_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/save_show_distance_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/save_show_duration_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/save_show_fuel_consumption_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/save_show_rpm_use_case.dart';
import 'package:baseproject/presentation/domain/use_case/save_show_speed_use_case.dart';
import 'package:baseproject/presentation/injection/injector.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_state.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_view_model.dart';
import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:baseproject/presentation/resources/app_text_styles.dart';
import 'package:baseproject/presentation/widget/icon_button.dart';
import 'package:baseproject/presentation/widget/snack_bar/error_snack_bar.dart';
import 'package:baseproject/presentation/widget/snack_bar/infor_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:telephony/telephony.dart';

import '../../../../ultilities/app_constant.dart';
import '../../../../ultilities/flutter_tts.dart';
import '../../../domain/use_case/get_driving_direction_object_use_case.dart';

final _provider =
    StateNotifierProvider.autoDispose<ObdDetailViewModel, ObdDetailState>(
  (ref) => ObdDetailViewModel(
    getDrivingDirectionObjectUseCase:
        injector.get<GetDrivingDirectionObjectUseCase>(),
    getShowSpeedUseCase: injector.get<GetShowSpeedUseCase>(),
    saveShowSpeedUseCase: injector.get<SaveShowSpeedUseCase>(),
    saveShowDurationUseCase: injector.get<SaveShowDurationUseCase>(),
    saveShowDistanceUseCase: injector.get<SaveShowDistanceUseCase>(),
    getShowDurationUseCase: injector.get<GetShowDurationUseCase>(),
    getShowDistanceUseCase: injector.get<GetShowDistanceUseCase>(),
    getShowRpmUseCase: injector.get<GetShowRpmUseCase>(),
    saveShowRpmUseCase: injector.get<SaveShowRpmUseCase>(),
    getShowFuelConsumptionUseCase:
        injector.get<GetShowFuelConsumptionUseCase>(),
    saveShowFuelConsumptionUseCase:
        injector.get<SaveShowFuelConsumptionUseCase>(),
  ),
);

class ObdDetailArgument {
  String address;

  ObdDetailArgument(this.address);
}

class ObdDetailView extends ConsumerStatefulWidget {
  const ObdDetailView(this.obdDetailArgument, {super.key});

  final ObdDetailArgument obdDetailArgument;

  @override
  ConsumerState<ObdDetailView> createState() => _ObdDetailView();
}

class _ObdDetailView extends ConsumerState<ObdDetailView>
    with SingleTickerProviderStateMixin {
  String text = '';
  String mytalk = '';
  String phoneNumber = '';
  BluetoothConnection? connection;
  Timer? timer;
  Timer? timerBlink;
  Timer? timerLocation;
  Telephony telephony = Telephony.instance;
  final speechToText = SpeechToText();
  bool listeningUser = false;

  bool isBlink = false;

  ObdDetailViewModel get viewModel => ref.read(_provider.notifier);

  ObdDetailState get state => ref.watch(_provider);

  final FlutterTextToSpeech flutterTextToSpeech = FlutterTextToSpeech();

  final audioPlayer = AudioPlayer();
  final mapController = MapController();
  Location? location;
  late LocationData locationData;

  LatLng get destination => ref.watch(destinationProvider);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
      location = Location();
      final isEnable = await location!.serviceEnabled();
      if (!isEnable) {
        if (mounted) {
          showInforSnackBar(
              context: context,
              message: "Please Access Internet and Location to use");
        }
      } else {
        locationData = await location!.getLocation();
        viewModel.updateCurrentLocation(
          LatLng(locationData.latitude ?? AppConstant.latitude,
              locationData.longitude ?? AppConstant.longitude),
        );
        mapController.move(LatLng(state.latitude, state.longitude), 18);
        viewModel.getRoutes(destination);
        timerLocation =
            Timer.periodic(const Duration(seconds: 4), (timer) async {
          try {
            locationData = await location!.getLocation();
            viewModel.updateCurrentLocation(LatLng(
                locationData.latitude ?? state.latitude,
                locationData.longitude ?? state.longitude));
            if (state.following) {
              mapController.move(LatLng(state.latitude, state.longitude), 18);
            }
            viewModel.getRoutes(destination);
          } catch (e) {}
        });
        await flutterTextToSpeech.initial();
        await initPlatformState();
        try {
          connection = await BluetoothConnection.toAddress(
              widget.obdDetailArgument.address);
          if (!connection!.isConnected) {
            if (mounted) {
              showErrorSnackBar(
                  context: context,
                  errorMessage: 'Can not connect to device,please reset app');
            }
          } else {
            if (mounted) {
              showInforSnackBar(context: context, message: "Connect Success");
            }
            timer = Timer.periodic(const Duration(milliseconds: 1500),
                (timer) async {
              if (connection != null && connection!.isConnected) {
                connection?.output
                    .add(Uint8List.fromList(utf8.encode("010c\r\n")));
                await Future.delayed(const Duration(milliseconds: 250));
                connection?.output
                    .add(Uint8List.fromList(utf8.encode("010d\r\n")));
                await Future.delayed(const Duration(milliseconds: 250));
                connection?.output
                    .add(Uint8List.fromList(utf8.encode("01A2\r\n")));
                await connection?.output.allSent;
                if (speechToText.isNotListening && listeningUser) {
                  listeningUser = false;
                  if (!mytalk.contains('reply')) {
                    flutterTextToSpeech
                        .speak('you start with reply for reply message');
                  } else {
                    mytalk = mytalk.substring(mytalk.indexOf('reply') + 5);
                    flutterTextToSpeech.speak(mytalk);

                    telephony.sendSms(to: phoneNumber, message: mytalk);
                  }
                }
              } else {
                try {
                  connection = await BluetoothConnection.toAddress(
                      widget.obdDetailArgument.address);

                  connection?.dispose();
                  if (mounted) {
                    showErrorSnackBar(
                        context: context,
                        errorMessage:
                            "Lost connect to device, please try again");
                    Navigator.pop(context);
                  }
                } catch (e) {
                  showErrorSnackBar(
                      context: context, errorMessage: "Lost connect to Device");
                  Navigator.pop(context);
                }
              }
            });
            connection?.input?.listen((event) {
              String string = String.fromCharCodes(event);
              List<String> speedL = string.split(' ');
              if (string.length > 3 && speedL.length > 2) {
                if (speedL[1] == '0D') {
                  viewModel
                      .updateSpeed((int.parse(speedL[2], radix: 16) * 3.6));
                } else if (speedL[1] == '0C') {
                  viewModel.updateRmp(((int.parse(speedL[2], radix: 16) * 256) +
                          int.parse(speedL[3], radix: 16)) /
                      4);
                }
                if (speedL[1] == 'A2') {
                  print(speedL[1]);
                  viewModel.updateFuelConsumption(
                      int.parse(speedL[2], radix: 16) / 10);
                }
              }
            });
          }
        } catch (e) {
          if (mounted) {
            showErrorSnackBar(
                context: context,
                errorMessage:
                    'Can not connect to device,please reset app or you can connect it manually');
            ref.read(flutterSerialBlueProvider).openSettings();
          }
        }
      }
    });
  }

  @override
  void dispose() {
    connection?.dispose();
    timer?.cancel();
    timerBlink?.cancel();
    timerLocation?.cancel();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(_provider, (ObdDetailState? previous, ObdDetailState next) {
      if (!state.isSafety) {
        if (audioPlayer.state != PlayerState.playing) {
          audioPlayer.play(AssetSource('sound/alert_sound.mp3'));
        }
        timerBlink = Timer(const Duration(milliseconds: 500), () {
          setState(() {
            isBlink = !isBlink;
          });
        });
      }
      if (state.isSafety && previous?.isSafety != next.isSafety) {
        audioPlayer.stop();
        setState(() {
          isBlink = false;
        });
        timerBlink?.cancel();
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(onMapReady: () {}),
              children: [
                TileLayer(
                  urlTemplate: AppConstant.mapUrlTheme,
                  userAgentPackageName: 'com.example.baseproject',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                        point: LatLng(state.latitude, state.longitude),
                        builder: (context) => const Icon(
                              Icons.location_searching,
                              size: 32,
                            )),
                    Marker(
                      height: 50,
                      point: ref.watch(destinationProvider),
                      builder: (context) => const Icon(
                        Icons.location_on_rounded,
                        size: 32,
                      ),
                    )
                  ],
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                        points: state.listForPolyLine,
                        color: Colors.red,
                        borderStrokeWidth: 2.5),
                  ],
                )
              ],
            ),
            Positioned(
              left: 12,
              top: 12,
              child: buildInformation(),
            ),
            Positioned(
                bottom: 5,
                right: 5,
                child: Column(
                  children: [
                    if (state.showDistance)
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: context.colors.primaryMain)),
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            const Icon(Icons.social_distance),
                            Text(
                              ' ${state.distance.ceil()} m',
                              style: AppTextStyles.labelLarge.copyWith(
                                  color: context.colors.backdropPrimary),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (state.showTime)
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: context.colors.primaryMain)),
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            const Icon(Icons.timelapse),
                            Text(
                              ' ${state.time.ceil()}s',
                              style: AppTextStyles.labelLarge.copyWith(
                                  color: context.colors.backdropPrimary),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (state.showFuelConsumption)
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: context.colors.primaryMain)),
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            const Icon(Icons.local_gas_station_rounded),
                            Text(
                              ' ${state.fuelConsumption} l/km',
                              style: AppTextStyles.labelLarge.copyWith(
                                  color: context.colors.backdropPrimary),
                            ),
                          ],
                        ),
                      ),
                  ],
                )),
            Positioned(
              right: 12,
              child: buildSettings(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildInformation() {
    return Column(
      children: [
        if (state.showSpeed)
          Container(
            constraints: const BoxConstraints(minHeight: 95, minWidth: 105),
            decoration: BoxDecoration(
                border: Border.all(color: context.colors.primaryMain)),
            alignment: Alignment.center,
            child: Stack(fit: StackFit.loose, children: [
              const Positioned(
                top:0,
                right: 0,
                left: 0,
                child: Center(child: Text("km/h")),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  state.speed.toStringAsFixed(1),
                  style: AppTextStyles.labelLarge.copyWith(
                      color: context.colors.backdropPrimary, fontSize: 50),
                ),
              ),
            ]),
          ),
        const SizedBox(
          height: 8,
        ),
        if (state.showRpm)
          Container(
            constraints: const BoxConstraints(minHeight: 95, minWidth: 105),
            decoration: BoxDecoration(
                border: Border.all(color: context.colors.primaryMain)),
            alignment: Alignment.center,
            child: Stack(fit: StackFit.loose, children: [
              Positioned(
                right: 5,
                child: Row(
                  children: const [
                    Icon(Icons.speed),
                    Text(" rpm"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  '${state.rpm.ceil()}',
                  style: AppTextStyles.labelLarge.copyWith(
                      color: context.colors.backdropPrimary, fontSize: 50),
                ),
              ),
            ]),
          ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget buildSelectItem(Function(bool) function, String title) {
    return Row(
      children: [
        Checkbox(
          value: state.following,
          onChanged: (value) => function(value ?? true),
        ),
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.labelSmall,
            maxLines: 2,
          ),
        )
      ],
    );
  }

  Widget buildSettings() {
    return AnimatedCrossFade(
      crossFadeState: state.showOptions
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: Column(children: [
        Container(
          color: Colors.white,
          width: 150,
          height: 200,
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: state.following,
                    onChanged: (value) =>
                        viewModel.updateFollowing(value ?? true),
                  ),
                  const Expanded(
                    child: Text(
                      "Follow location",
                      style: AppTextStyles.labelSmall,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
              Row(children: [
                Checkbox(
                  value: state.showSpeed,
                  onChanged: (value) async =>
                      viewModel.updateOption(showSpeed: value),
                ),
                const Expanded(
                    child: Text(
                  "Show speed",
                  style: AppTextStyles.labelSmall,
                  maxLines: 2,
                )),
              ]),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Checkbox(
                    value: state.showDistance,
                    onChanged: (value) =>
                        viewModel.updateOption(showDistance: value),
                  ),
                  const Expanded(
                    child: Text(
                      "Show distance",
                      style: AppTextStyles.labelSmall,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Checkbox(
                    value: state.showTime,
                    onChanged: (value) =>
                        viewModel.updateOption(showTime: value),
                  ),
                  const Expanded(
                    child: Text(
                      "Show Time",
                      style: AppTextStyles.labelSmall,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Checkbox(
                    value: state.showFuelConsumption,
                    onChanged: (value) => viewModel.updateOption(
                        showFuelConsumption: value ?? true),
                  ),
                  const Expanded(
                    child: Text(
                      "Show Fuel Consumption",
                      style: AppTextStyles.labelSmall,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        AppIconButton(
          icon: Icons.clear,
          onTap: () => viewModel.updateShowOption(false),
        ),
      ]),
      secondChild: AppIconButton(
        icon: Icons.settings,
        onTap: () {
          viewModel.updateShowOption(true);
        },
      ),
      duration: const Duration(milliseconds: 300),
    );
  }

  Future<void> initPlatformState() async {
    final bool? result = await telephony.requestPhoneAndSmsPermissions;
    if (result != null && result) {
      telephony.listenIncomingSms(
          onNewMessage: (message) {
            Timer(const Duration(milliseconds: 500), () async {
              await flutterTextToSpeech
                  .speak('${message.address} send content: ${message.body}');
              phoneNumber = message.address ?? '';
              await Future.delayed(const Duration(seconds: 4), () async {
                await flutterTextToSpeech
                    .speak('You start with Reply for reply message');

                final abc = await speechToText.initialize();
                if (abc) {
                  speechToText.listen(
                    onResult: (result) {
                      mytalk = result.recognizedWords;
                    },
                  );
                  listeningUser = true;
                } else {}
              });
            });
          },
          listenInBackground: false);
    }

    if (!mounted) return;
  }
}
