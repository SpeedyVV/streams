import 'dart:async';
import 'package:streams/speaker.dart';

class NumberListener {
  final Stream<int> speakerStream;
  NumberListener(this.speakerStream);

  //final speakerStream = NumberSpeaker().stream;

  void listen()  {
    print('Listener: Awaiting anxiously for the speaker to start speaking!');
    //await for (var topic in speakerStream!) {
    var wholeSpeach = speakerStream.listen(
      (topic) {
        print('Listener: Great topic$topic. APPLAUSE!!!!');
      },
      onError: (err) {
        print('Listener: Error: $err');
      },
      cancelOnError: false,
      onDone: () {
        print('Listener: Thunderous  APPLAUSE!!!!!');
      }
    );
  }
}