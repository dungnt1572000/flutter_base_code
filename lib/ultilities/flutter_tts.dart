import 'package:flutter_tts/flutter_tts.dart';

class FlutterTextToSpeech{
   FlutterTts flutterTts = FlutterTts();
   Future<void> initial()async {
     await flutterTts.setLanguage("en-US");

     await flutterTts.setSpeechRate(0.5);

     await flutterTts.setVolume(1.0);

     await flutterTts.setPitch(1.0);
   }
   Future speak(String msg)async{
     await flutterTts.setSpeechRate(0.5);
     await flutterTts.speak(msg);
   }

   Future stop() async{
    await flutterTts.stop();
   }
   
}