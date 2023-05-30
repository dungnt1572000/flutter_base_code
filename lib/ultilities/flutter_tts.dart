import 'package:flutter_tts/flutter_tts.dart';

class FlutterTextToSpeech {
  FlutterTts flutterTts = FlutterTts();

  Future<void> initial() async {
    await flutterTts.setLanguage("en-US");

    await flutterTts.setSpeechRate(0.34);

    await flutterTts.setVolume(0.9);

    await flutterTts.setPitch(1.0);
  }

  Future speak(String msg) async {
    await flutterTts.speak(msg);
  }

  Future<bool> isCompleteSpeaker() async {
    var i = false;
    await flutterTts.awaitSpeakCompletion(true);
    return i;
  }

  Future stop() async {
    await flutterTts.stop();
  }
}
