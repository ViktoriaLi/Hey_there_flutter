import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'CVPage.dart';

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
  String greeting = "Hey there";
  var color = Colors.teal[50];
  void _incrementCounter() {
    setState(() {
      _counter++;
      print("counter");
    });
  }

  void _openCV() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CVPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Ink(
            decoration: const ShapeDecoration(
              color: Colors.black,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(Icons.android),
              color: Colors.white,
              onPressed: _openCV,
            ),
          ),
        ],
      ),
      body: _Content(),
    );
  }

  Widget _Content() {
    return GestureDetector(
      onTap: () {
        setState(() {
          print('MyButton was tapped!');
          color =
              Colors.primaries[math.Random().nextInt(Colors.primaries.length)];
          //_incrementCounter();
        });
      },
      child: buildContainer(),
    );
  }

  Container buildContainer() {
    return buildContainerWithColor();
  }

  Container buildContainerWithColor() {
    return Container(
      color: color,
      width: double.infinity,
      height: double.infinity,
      child: Center(
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
