import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lab_examples/appstyles/app_colors.dart';
import 'package:lab_examples/appstyles/app_styles.dart';

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  var leftDiceNumber = 1;

  var rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: AppStyles.textwidget("Dicee",
          fontWeight: FontWeight.w300,
          color: AppColors.white,
          heightInline: 1.2),
      centerTitle: true,
      backgroundColor: Colors.red,
    );

    final body = Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed:setRandomNumbers,
              child: Image(
                image: AssetImage('images/dice$leftDiceNumber.png'),
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: setRandomNumbers,
              child: Image(
                image: AssetImage('images/dice$rightDiceNumber.png'),
              ),
            ),
          )
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: appBar,
      body: body,
    );
  }

  void setRandomNumbers() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }
}
