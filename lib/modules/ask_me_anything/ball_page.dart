import 'dart:math';

import 'package:flutter/material.dart';

class BallPage extends StatefulWidget {
  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Image(
          image: AssetImage('images/ball$ballNumber.png'),
        ),
      ),
    );
  }

  void onPressed() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }
}
