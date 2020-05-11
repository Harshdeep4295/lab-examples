import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Function hp = Screen(MediaQuery.of(context).size).hp;
    Function wp = Screen(MediaQuery.of(context).size).wp;
    ScreenUtil.init(context, width: 480, height: 810, allowFontScaling: true);
    final appBar = AppBar(
      title: AppStyles.textwidget("Lab Experiments",
          color: AppColors.antiqueBrass, heightInline: 1.5),
    );

    final body = SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Container(
            height: hp(6),
            width: wp(60),
            child: AppStyles.button("I am Rich", onClick: () {
              Navigator.pushNamed(context, '/rich_home');
            }),
          ),
        ),
        SizedBox(
          height: wp(6),
        ),
        Center(
          child: Container(
            height: hp(6),
            width: wp(60),
            child: AppStyles.button("MI Card", onClick: () {
              Navigator.pushNamed(context, '/mi_card');
            }),
          ),
        ),
        SizedBox(
          height: wp(6),
        ),
        Center(
          child: Container(
            height: hp(6),
            width: wp(60),
            child: AppStyles.button("Dice game", onClick: () {
              Navigator.pushNamed(context, '/dice_game');
            }),
          ),
        ),
        SizedBox(
          height: wp(6),
        ),
        Center(
          child: Container(
            height: hp(6),
            width: wp(60),
            child: AppStyles.button("Ask Me Anything", onClick: () {
              Navigator.pushNamed(context, '/ask_me_anything');
            }),
          ),
        ),
        SizedBox(
          height: wp(6),
        ),
        Center(
          child: Container(
            height: hp(6),
            width: wp(60),
            child: AppStyles.button("Xylophone", onClick: () {
              Navigator.pushNamed(context, '/xylophone_home');
            }),
          ),
        ),
        SizedBox(
          height: wp(6),
        ),
        Center(
          child: Container(
            height: hp(6),
            width: wp(60),
            child: AppStyles.button("Quizzler", onClick: () {
              Navigator.pushNamed(context, '/quizzler');
            }),
          ),
        ),
        SizedBox(
          height: wp(6),
        ),
        Center(
          child: Container(
            height: hp(6),
            width: wp(60),
            child: AppStyles.button("Destiny", onClick: () {
              Navigator.pushNamed(context, '/destiny');
            }),
          ),
        ),
        SizedBox(
          height: wp(6),
        ),
        Center(
          child: Container(
            height: hp(6),
            width: wp(60),
            child: AppStyles.button("BMI Calculator", onClick: () {
              Navigator.pushNamed(context, '/bmi_calculator');
            }),
          ),
        )
      ],
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: body,
      resizeToAvoidBottomInset: true,
    );
  }
}
