import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _greeting = "Hey there";
  void _incrementCounter() {
    setState(() {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _Content(_greeting),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _Content(String greeting) {
    final my_color_variable = Colors.red;

    return GestureDetector(
          onTap: () {
            setState(() {
              my_color_variable: Colors.grey[300];

              print('MyButton was tapped!');
            });
          },
          child: buildContainer (greeting),
        );
      }

      Container buildContainer (String greeting) {
        var color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
        return Container(
        color: color,
        width: double.infinity,
        height: double.infinity,
        child: Center (
          child: Text(
            '$greeting',
            ),
          ),

        );
      }
}
