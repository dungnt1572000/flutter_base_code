import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_state.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_view_model.dart';
import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:baseproject/presentation/resources/app_text_styles.dart';
import 'package:baseproject/presentation/widget/snack_bar/error_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider =
    StateNotifierProvider.autoDispose<ObdDetailViewModel, ObdDetailState>(
        (ref) => ObdDetailViewModel());

class ObdDetailView extends ConsumerStatefulWidget {
  const ObdDetailView({Key? key, required this.obdDetailArgument})
      : super(key: key);
  final ObdDetailArgument obdDetailArgument;

  @override
  ConsumerState<ObdDetailView> createState() => _ObdDetailViewState();
}

class ObdDetailArgument {
  String address;

  ObdDetailArgument(this.address);
}

class _ObdDetailViewState extends ConsumerState<ObdDetailView> {
  final StreamController<double> _sliderValueController =
      StreamController<double>();

  ObdDetailState get state => ref.watch(_provider);

  ObdDetailViewModel get viewModel => ref.read(_provider.notifier);

  final audioPlayer = AudioPlayer();

  BluetoothConnection? connection;

  Timer? timer;
  Timer? blinking;
  bool _isVisible = true;
  void _startBlinking() {
    blinking=  Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _isVisible = !_isVisible;
      });
    });
  }
  void _stopBlinking(){
    blinking?.cancel();
    setState(() {
      _isVisible = false;
    });
  }
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
      try {
        connection = await BluetoothConnection.toAddress(
            widget.obdDetailArgument.address);
        if (connection!.isConnected) {
          print('Thiet bi da connect roi');
          timer =
              Timer.periodic(const Duration(milliseconds: 1500), (timer) async {
            connection?.output.add(Uint8List.fromList(utf8.encode("010d\r\n")));
            await Future.delayed(const Duration(milliseconds: 300));
            connection?.output.add(Uint8List.fromList(utf8.encode("010c\r\n")));
            await Future.delayed(const Duration(milliseconds: 300));
            connection?.output.add(Uint8List.fromList(utf8.encode("0105\r\n")));
            await Future.delayed(const Duration(milliseconds: 300));
            // connection?.output
            //     .add(Uint8List.fromList(utf8.encode("015e\r\n")));

            await connection?.output.allSent;
          });
        }
        connection?.input?.listen((event) {
          String string = String.fromCharCodes(event);
          print(string);
          List<String> speedL = string.split(' ');
          if (string.length > 3) {
            if (speedL[1] == '0D') {
              viewModel.updateSpeed(int.parse(speedL[2], radix: 16) * 1.0);
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
      } catch (e) {
        showErrorSnackBar(
            context: context,
            errorMessage: 'Something become wrong please restart app ');
      }
    });
  }

  @override
  void dispose() {
    _sliderValueController.close();
    connection?.dispose();
    timer?.cancel();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(_provider, (ObdDetailState? previous, ObdDetailState next) {
      if (!next.isSafety && audioPlayer.state != PlayerState.playing) {
        audioPlayer.play(AssetSource('sound/alert_sound.mp3'));
        Future.delayed(const Duration(seconds: 3))
            .then((value) => audioPlayer.stop());
        _startBlinking();
      }else{
        _stopBlinking();
      }
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.updateSpeed(36);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            color: _isVisible?Colors.white:Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildItem('SPEED', state.speed.toString())),
                    Expanded(child: _buildItem('RPM', state.rpm.toString())),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildItem(
                          'Fuel', state.mucnhienlieu.toString()),
                    ),
                    Expanded(
                      child: _buildItem(
                          'Engine Temperature', state.nhietdodongco.toString()),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: state.isSafety
                          ? Colors.blue.withOpacity(0.5)
                          : Colors.red),
                  child: Center(
                    child: Text(
                      state.isSafety ? 'Safety' : 'Dangerous',
                      style: AppTextStyles.labelLargeLight
                          .copyWith(color: context.colors.textContrastOnDark),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String title, String data) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.headingMediumLight
              .copyWith(color: context.colors.primaryText),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          data,
          style: AppTextStyles.headingMediumLight
              .copyWith(color: context.colors.backdropPrimary),
        )
      ],
    );
  }
}
