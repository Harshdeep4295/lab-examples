import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:lab_examples/appstyles/app_colors.dart';
import 'package:lab_examples/appstyles/app_styles.dart';

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
      title: AppStyles.textwidget("Welcome",
          color: AppColors.black, heightInline: 1.5),
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
            child: AppStyles.button("I am Rich",
                textColor: AppColors.deepChapagne,
                fontWeight: FontWeight.w600,
                fontSize: AppStyles.fontSize(17),
                radius: 0, onClick: () {
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
            child: AppStyles.button("MI Card",
                textColor: AppColors.deepChapagne,
                fontWeight: FontWeight.w600,
                fontSize: AppStyles.fontSize(17),
                radius: 0, onClick: () {
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
            child: AppStyles.button("Dice game",
                textColor: AppColors.deepChapagne,
                fontWeight: FontWeight.w600,
                fontSize: AppStyles.fontSize(17),
                radius: 0, onClick: () {
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
            child: AppStyles.button("Ask Me Anything",
                textColor: AppColors.deepChapagne,
                fontWeight: FontWeight.w600,
                fontSize: AppStyles.fontSize(17),
                radius: 0, onClick: () {
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
            child: AppStyles.button("Xylophone",
                textColor: AppColors.deepChapagne,
                fontWeight: FontWeight.w600,
                fontSize: AppStyles.fontSize(17),
                radius: 0, onClick: () {
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
            child: AppStyles.button("Quizzler",
                textColor: AppColors.deepChapagne,
                fontWeight: FontWeight.w600,
                fontSize: AppStyles.fontSize(17),
                radius: 0, onClick: () {
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
            child: AppStyles.button("Destiny",
                textColor: AppColors.deepChapagne,
                fontWeight: FontWeight.w600,
                fontSize: AppStyles.fontSize(17),
                radius: 0, onClick: () {
              Navigator.pushNamed(context, '/destiny');
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
