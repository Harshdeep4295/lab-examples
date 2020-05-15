import 'package:flutter/material.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';
import 'package:lab_experiments/landing_screen.dart';
import 'package:lab_experiments/modules/ask_me_anything/ask_me_anything_home.dart';
import 'package:lab_experiments/modules/bmi_calculator/Screens/bmi_calculator_home.dart';
import 'package:lab_experiments/modules/destiny/destiny_home.dart';
import 'package:lab_experiments/modules/dice/dice_game_home.dart';
import 'package:lab_experiments/modules/i_am_rich/i_am_rich_home.dart';
import 'package:lab_experiments/modules/live_weather/screens/loading_screen.dart';
import 'package:lab_experiments/modules/mi_card/mi_card_home.dart';
import 'package:lab_experiments/modules/quizzare/quizarre_home.dart';
import 'package:lab_experiments/modules/xylophone/xylophone_home.dart';

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
      theme: ThemeData.dark().copyWith(
        primaryColor: AppColors.darkColor,
        accentColor: AppColors.paradisePink,
        scaffoldBackgroundColor: AppColors.darkColor,
        appBarTheme: AppBarTheme(
          color: AppColors.darkColor,
          brightness: Brightness.light,
        ),
      ),
      home: LandingScreen(),
      routes: {
        '/rich_home': (context) => IAMRich(),
        '/mi_card': (context) => MiCard(),
        '/dice_game': (context) => DiceGame(),
        '/ask_me_anything': (context) => AskMeAnything(),
        '/xylophone_home': (context) => Xylophone(),
        '/quizzler': (context) => Quizzler(),
        '/destiny': (context) => Destiny(),
        '/bmi_calculator': (context) => BMICalculator(),
        '/live_weather': (context) => LoadingScreen(),
      },
    );
  }
}
