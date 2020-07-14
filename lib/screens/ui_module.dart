import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';

class UIModules extends StatefulWidget {
  @override
  _UIModulesState createState() => _UIModulesState();
}

class _UIModulesState extends State<UIModules> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) { 
    Function wp = Screen(MediaQuery.of(context).size).wp;

    final body = SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppStyles.button("I am Rich", onClick: () {
            Navigator.pushNamed(context, '/rich_home');
          }),
          SizedBox(
            height: wp(6),
          ),
          AppStyles.button("MI Card", onClick: () {
            Navigator.pushNamed(context, '/mi_card');
          }),
          SizedBox(
            height: wp(6),
          ),
          AppStyles.button("Dice game", onClick: () {
            Navigator.pushNamed(context, '/dice_game');
          }),
          SizedBox(
            height: wp(6),
          ),
          AppStyles.button("Ask Me Anything", onClick: () {
            Navigator.pushNamed(context, '/ask_me_anything');
          }),
          SizedBox(
            height: wp(6),
          ),
          AppStyles.button("Xylophone", onClick: () {
            Navigator.pushNamed(context, '/xylophone_home');
          }),
          SizedBox(
            height: wp(6),
          ),
          AppStyles.button("Quizzler", onClick: () {
            Navigator.pushNamed(context, '/quizzler');
          }),
          SizedBox(
            height: wp(6),
          ),
          AppStyles.button("Destiny", onClick: () {
            Navigator.pushNamed(context, '/destiny');
          }),
          SizedBox(
            height: wp(6),
          ),
          AppStyles.button("BMI Calculator", onClick: () {
            Navigator.pushNamed(context, '/bmi_calculator');
          }),
          SizedBox(
            height: wp(6),
          ),
          AppStyles.button("Live Weather", onClick: () {
            Navigator.pushNamed(context, '/live_weather');
          }),
          SizedBox(
            height: wp(6),
          ),
          AppStyles.button("Ticker App", onClick: () {
            Navigator.pushNamed(context, '/ticker_app');
          }),
          SizedBox(
            height: wp(6),
          ),
        ],
      ),
    );

    return body;
  }
}
