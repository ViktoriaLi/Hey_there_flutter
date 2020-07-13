import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(HeyThereApp());
}

class HeyThereApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hey there!',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HeyTherePage(title: 'Welcome Page'),
    );
  }
}

class HeyTherePage extends StatefulWidget {
  HeyTherePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HeyTherePageState createState() => HeyTherePageState();
}

class HeyTherePageState extends State<HeyTherePage> {
  int _counter = 0;
  String _greeting = "Hey there";
  void _incrementCounter() {
    setState(() {
      _counter++;
      print("counter");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _Content(_greeting),
    );
  }

  Widget _Content(String greeting) {
    return GestureDetector(
          onTap: () {
            setState(() {
              print('MyButton was tapped!');
              _incrementCounter();
            });
          },
          child: buildContainer (greeting),
        );
      }

      Container buildContainer (String greeting) {
        var color; //= Colors.primaries[math.Random().nextInt(Colors.primaries.length)].withOpacity(0.5);
        //Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
        _counter == 0 ? color = Colors.teal[50] : color = Colors.primaries[math.Random().nextInt(Colors.primaries.length)].withOpacity(0.5);
        return buildContainerWithColor(color, greeting);
      }

      Container buildContainerWithColor(Color color, String greeting) {
        return Container(
          color: color,
          width: double.infinity,
          height: double.infinity,
          child: Center (
            child: Text(
              '$greeting',
              style: TextStyle(
                fontSize: 44,
              ),
              ),
            ),
          );
      }
}
