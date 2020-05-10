import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:lab_examples/appstyles/app_colors.dart';
import 'package:lab_examples/appstyles/app_styles.dart';

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  final player = AudioCache();

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: AppStyles.textwidget("Xylophone",
          fontWeight: FontWeight.w300,
          color: AppColors.white,
          heightInline: 1.2),
      centerTitle: true,
      backgroundColor: Colors.blueGrey[900],
    );

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildKey(Colors.red, 1),
        buildKey(Colors.orange, 2),
        buildKey(Colors.yellow, 3),
        buildKey(Colors.green, 4),
        buildKey(Colors.teal, 5),
        buildKey(Colors.blue, 6),
        buildKey(Colors.purple, 7),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar,
      body: body,
    );
  }

  void onPresseds(int value) {
    player.play('note$value.wav');
  }

  buildKey(Color color, int key) {
    return Expanded(
      child: FlatButton(
        onPressed: () => onPresseds(key),
        color: color,
      ),
    );
  }
}
