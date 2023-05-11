import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_state.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_view_model.dart';
import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:baseproject/presentation/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();

    // timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    //
    // });

    Future.delayed(Duration.zero, () async {
      try {
        connection = await BluetoothConnection.toAddress(
            widget.obdDetailArgument.address);
        if (connection!.isConnected ) {
          print('Thiet bi da connect roi');
          String message = "010d";
          connection?.output.add(Uint8List.fromList(utf8.encode("$message\r\n")));
          await connection?.output.allSent;
        }
        connection?.input?.listen((event) {
          String string = String.fromCharCodes(event);
          print(string);
          List<String> speedL = string.split(' ');
          if(string.length>3){
           if(speedL[1]=='0C') {
             viewModel.updateSpeed(((int.parse(speedL[2], radix: 16) * 256) +
                 int.parse(speedL[3], radix: 16)) / 100);
           }
           if(speedL[1]=='0D') {
             viewModel.updateSpeed(((int.parse(speedL[2], radix: 16) * 256) +
                 int.parse(speedL[3], radix: 16)) / 100);
           }
           if(speedL[1]=='05'){
             viewModel.updatemucnhienlieu(int.parse(speedL[2],radix: 16)*1.0);
           }

          }
        });
      } catch (e) {
        print(e.toString());
      }
    });

    _sliderValueController.stream.listen((sliderValue) {
      if (sliderValue > 0.5 && audioPlayer.state != PlayerState.playing) {
        audioPlayer.play(AssetSource('sound/alert_sound.mp3'));
        Future.delayed(const Duration(seconds: 3))
            .then((value) => audioPlayer.release());
      } else {}
    });
  }

  @override
  void dispose() {
    _sliderValueController.close();
    connection?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async{
              if (connection!.isConnected ) {
                print('Thiet bi da connect roi');
                String message = "010c";
                Uint8List bytes = Uint8List.fromList(message.codeUnits);
                connection?.output.add(Uint8List.fromList(utf8.encode("$message\r\n")));
                await connection?.output.allSent;
              }
            },
          ),
          SizedBox(
            height: 12,
          ),
          FloatingActionButton(
              child: Text('disconnect'),
              onPressed: (){
            connection?.finish();
            connection?.dispose();
          })
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.amber,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildItem('Van toc', state.speed.toString()),
                      _buildItem('Vong xoay', '3.23'),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildItem('ap suat lop', '3.23'),
                      _buildItem('nhiet do dong co', '3.23'),
                    ],
                  ),
                ],
              ),
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
          style: AppTextStyles.textSmallBold
              .copyWith(color: context.colors.primaryText),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          data,
          style: AppTextStyles.textMediumBold
              .copyWith(color: context.colors.backdropPrimary),
        )
      ],
    );
  }
}
