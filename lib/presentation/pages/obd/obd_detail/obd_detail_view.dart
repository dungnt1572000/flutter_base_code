import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_state.dart';
import 'package:baseproject/presentation/pages/obd/obd_detail/obd_detail_view_model.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Slider(
              value: state.value,
              onChanged: (value) {
                _sliderValueController.sink.add(value);
                viewModel.updateValue(value);
              }),
        ),
      ),
    );
  }
}
