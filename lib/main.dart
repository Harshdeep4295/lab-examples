import 'package:flutter/material.dart';
import 'package:lab_experiments/modules/arch_modules/flutter_arch.dart';
import 'package:lab_experiments/modules/ui_modeles/ask_me_anything/ask_me_anything_home.dart';
import 'package:lab_experiments/modules/ui_modeles/bmi_calculator/Screens/bmi_calculator_home.dart';
import 'package:lab_experiments/modules/ui_modeles/destiny/destiny_home.dart';
import 'package:lab_experiments/modules/ui_modeles/dice/dice_game_home.dart';
import 'package:lab_experiments/modules/ui_modeles/i_am_rich/i_am_rich_home.dart';
import 'package:lab_experiments/modules/ui_modeles/live_weather/screens/loading_screen.dart';
import 'package:lab_experiments/modules/ui_modeles/mi_card/mi_card_home.dart';
import 'package:lab_experiments/modules/ui_modeles/quizzare/quizarre_home.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/auth.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/landing_screen.dart';
import 'package:lab_experiments/modules/ui_modeles/xylophone/xylophone_home.dart';
import 'package:provider/provider.dart';

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
    return Provider<AuthBase>(
      create: (context) {
        return Auth();
      },
      child: MaterialApp(
        // removed for time tracker(ticker) app
        // theme: ThemeData.dark().copyWith(
        //     primaryColor: AppColors.darkColor,
        //     accentColor: AppColors.paradisePink,
        //     scaffoldBackgroundColor: AppColors.darkColor,
        //     appBarTheme: AppBarTheme(
        //       color: AppColors.darkColor,
        //       brightness: Brightness.dark,
        //     ),
        //     textTheme:
        //         TextTheme(subtitle1: AppStyles.textStyle(AppColors.black, 18))),
        home: LandingPage(),
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
          '/stream_example': (context) => HowStreamsWork(),
        },
      ),
    );
  }
}
