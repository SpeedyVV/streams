import 'dart:async';
import 'dart:io';

class NumberSpeaker {

  final StreamController _streamController = StreamController<int>();

  Stream<int> get stream {
    return _streamController.stream as Stream<int>;
  }

  int _topicNumber = 1;
  int _numberOfTopics = 20;

  speak() async {
    print('Speaker: Oh, there is someone listening!');
    while (_topicNumber <= _numberOfTopics) {
      print('Speaker: Topic$_topicNumber loud and clear');
      _streamController.add(_topicNumber);
      print('Speaker: Waiting 1/4 second for applause.');
      await Future.delayed(Duration(milliseconds: 250));
      //Future.delayed(Duration(seconds: 3));

      _topicNumber = _topicNumber + 1;
    }
    print('Speaker: And that is all I have to say.\nThank you for listening.');
    _streamController.close();
  }
}