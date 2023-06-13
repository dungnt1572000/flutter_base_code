import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;
import 'dart:isolate';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:baseproject/data/providers/flutter_serial_blue_provider.dart';
import 'package:baseproject/presentation/navigation/app_navigator_provider.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_state.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_view_model.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/widget/camera_view.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/widget/object_detector_painter.dart';
import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:baseproject/presentation/resources/app_text_styles.dart';
import 'package:baseproject/presentation/widget/snack_bar/error_snack_bar.dart';
import 'package:baseproject/presentation/widget/snack_bar/infor_snack_bar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:path/path.dart' as mypath;
import 'package:path_provider/path_provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:telephony/telephony.dart';

import '../../../../ultilities/flutter_tts.dart';

final _provider =
    StateNotifierProvider.autoDispose<ObdDetailViewModel, ObdDetailState>(
        (ref) => ObdDetailViewModel());

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
  Telephony telephony = Telephony.instance;
  final speechToText = SpeechToText();
  bool listeningUser = false;

  bool isBlink = false;

  ObdDetailViewModel get viewModel => ref.read(_provider.notifier);

  ObdDetailState get state => ref.watch(_provider);

  final FlutterTextToSpeech flutterTextToSpeech = FlutterTextToSpeech();

  final audioPlayer = AudioPlayer();

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
                } else {
                  print('deo on roi');
                }
              });
            });
          },
          listenInBackground: false);
    }

    if (!mounted) return;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await flutterTextToSpeech.initial();
      await initPlatformState();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
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
          if(mounted) {
            showInforSnackBar(context: context, message: "Connect Success");
          }
          timer =
              Timer.periodic(const Duration(milliseconds: 1500), (timer) async {
            if (connection != null && connection!.isConnected) {
              connection?.output
                  .add(Uint8List.fromList(utf8.encode("010d\r\n")));
              await connection?.output.allSent;
              // print('${speechToText.isNotListening}&& $liseningUser');
              if (speechToText.isNotListening && listeningUser) {
                listeningUser = false;
                print(mytalk);
                print('day la phone: $phoneNumber');
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
              connection = await BluetoothConnection.toAddress(
                  widget.obdDetailArgument.address);
            }
          });
          connection?.input?.listen((event) {
            String string = String.fromCharCodes(event);
            print(string);
            List<String> speedL = string.split(' ');
            if (string.length > 3 && speedL.length > 2) {
              if (speedL[1] == '0D') {
                viewModel.updateSpeed((int.parse(speedL[2], radix: 16) * 1.0));
              } else if (speedL[1] == '0C') {
                viewModel.updateRmp(((int.parse(speedL[2], radix: 16) * 256) +
                        int.parse(speedL[3], radix: 16)) /
                    100);
              } else if (speedL[1] == '05') {
                viewModel
                    .updatemucnhienlieu(int.parse(speedL[2], radix: 16) * 1.0);
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
    });
  }

  @override
  void dispose() {
    connection?.dispose();
    timer?.cancel();
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Text('pick'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: isBlink ? Colors.red.withOpacity(0.5) : null),
          child: Column(
            children: [
              _carInformation(),
              const SizedBox(
                height: 48,
              ),
              _buildAlert(),
            ],
          ),
        ),
      )),
    );
  }

  Widget _carInformation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            height: 150,
            decoration: BoxDecoration(
                border: Border.all(color: context.colors.success)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Speed',
                  style: AppTextStyles.textMediumBold
                      .copyWith(color: context.colors.textPrimary),
                ),
                Text(state.speed.toString())
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 150,
            decoration: BoxDecoration(
                border: Border.all(color: context.colors.success)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'RPM',
                  style: AppTextStyles.textMediumBold
                      .copyWith(color: context.colors.textPrimary),
                ),
                Text(state.rpm.toString())
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAlert() {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: state.isSafety ? Colors.blue : Colors.red,
      ),
      child: Center(
        child: Text(
          state.isSafety ? 'Safe' : 'Dangerous',
          style: AppTextStyles.textLargeBold
              .copyWith(color: context.colors.textContrastOnDark, fontSize: 30),
        ),
      ),
    );
  }
}
