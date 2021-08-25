import 'package:flutter/material.dart';
import 'package:streams/speaker.dart';
import 'package:streams/listener1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print ('MyApp build executing');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  final String title;

  MyHomePage({Key? key, required this.title }) : super(key: key) {
    print('HomePage constructor executing');
  }

  @override
  _MyHomePageState createState() {
    print('MyHomePage createState() _MyHomePageState executing');
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  _MyHomePageState() : super(){
    print('_MyHomePageState constructor executing');

    var speaker = NumberSpeaker();
    var listener1 = NumberListener(speaker.stream);

    listener1.listen();
    speaker.speak();

  }

  void _incrementCounter() {
    setState(() {
      print('_MyHomePageState setState() executing');
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    print('_MyHomePageState build() executing');
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('_MyHomePageState /  floatingActionButton: onPressed executing');
          _incrementCounter();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
