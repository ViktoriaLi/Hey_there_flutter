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
  var bonusButton = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Container(
            decoration: const ShapeDecoration(
              color: Colors.limeAccent,
              shape: CircleBorder(),
            ),
            child: bonusButton,
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
          _showButton();
        });
      },
      child: _buildContainerWithColor(),
    );
  }

  Container _buildContainerWithColor() {
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

  void _openCV() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CVPage()),
    );
  }

  void _showButton() {
    setState(() {
      _counter++;
      if (_counter % 3 == 0) {
        bonusButton = Container(
          child: IconButton(
            icon: Icon(Icons.face),
            iconSize: 32,
            color: Colors.black,
            onPressed: _openCV,
          ),
        );
      } else {
        bonusButton = null;
      }
    });
  }
}
