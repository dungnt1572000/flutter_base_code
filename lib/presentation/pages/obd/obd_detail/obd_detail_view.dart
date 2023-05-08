import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_state.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_view_model.dart';
import 'package:baseproject/presentation/resources/app_colors.dart';
import 'package:baseproject/presentation/resources/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _provider =
    StateNotifierProvider.autoDispose<ObdDetailViewModel, ObdDetailState>(
        (ref) => ObdDetailViewModel());

class ObdDetailView extends ConsumerStatefulWidget {
  const ObdDetailView({Key? key}) : super(key: key);

  @override
  ConsumerState<ObdDetailView> createState() => _ObdDetailViewState();
}

class _ObdDetailViewState extends ConsumerState<ObdDetailView> {
  final StreamController<double> _sliderValueController = StreamController<double>();

  ObdDetailState get state => ref.watch(_provider);

  ObdDetailViewModel get viewModel => ref.read(_provider.notifier);

  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _sliderValueController.stream.listen((sliderValue) {
      if(sliderValue>0.5 && audioPlayer.state != PlayerState.playing){
        audioPlayer.play(AssetSource('sound/alert_sound.mp3'));
        Future.delayed(const Duration(seconds: 3)).then((value) => audioPlayer.release());
      }else{

      }
    });
  }

  @override
  void dispose() {
    _sliderValueController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      _buildItem('Van toc','3.23'),
                      _buildItem('Vong xoay','3.23'),
                    ],
                  ),
                  SizedBox(height: 24,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildItem('ap suat lop','3.23'),
                      _buildItem('nhiet do dong co','3.23'),
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
        Text(title,style: AppTextStyles.textSmallBold.copyWith(color: context.colors.primaryText),),
        SizedBox(height: 12,),
        Text(data,style: AppTextStyles.textMediumBold.copyWith(color: context.colors.backdropPrimary),)
      ],
    );
  }
}
