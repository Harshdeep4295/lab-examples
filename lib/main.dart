import 'package:flutter/material.dart';
import 'package:lab_examples/appstyles/app_colors.dart';
import 'package:lab_examples/landing_screen.dart';
import 'package:lab_examples/modules/mi_card/mi_card_home.dart';

import 'modules/dice/dice_game_home.dart';
import 'modules/i_am_rich/i_am_rich_home.dart';

// Stating point of application
void main() {
  runApp(App());
}

class App extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.deepChapagne,
      ),
      home: LandingScreen(),
      routes: {
        '/rich_home': (context) => IAMRich(),
        '/mi_card': (context) => MiCard(),
        '/dice_game': (context) => DiceGame(),
      },
    );
  }
}
