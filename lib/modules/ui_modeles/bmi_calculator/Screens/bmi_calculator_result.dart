import 'package:flutter/material.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';
import 'package:lab_experiments/modules/ui_modeles/bmi_calculator/components/bottom_button.dart';
import 'package:lab_experiments/modules/ui_modeles/bmi_calculator/components/reuasable_card.dart';

class BMIResultPage extends StatelessWidget {
  final String result;
  final String score;
  final String description;

  const BMIResultPage({Key key, this.result, this.score, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: AppStyles.textwidget("BMI Result",
          fontWeight: FontWeight.w300,
          color: AppColors.white,
          heightInline: 1.2),
      centerTitle: true,
    );
    final body = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 20.0),
            child: AppStyles.textwidget("Your Result",
                fontSize: 50,
                color: AppColors.white,
                fontWeight: FontWeight.w900),
          ),
        ),
        Expanded(
            flex: 5,
            child: ReusableCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  AppStyles.textwidget(result.toUpperCase(),
                      fontSize: 22.0,
                      color: AppColors.greenColor,
                      fontWeight: FontWeight.bold),
                  AppStyles.textwidget(score,
                      fontSize: 100,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold),
                  AppStyles.textwidget(description,
                      fontSize: 18,
                      color: AppColors.greyLight,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w900),
                ],
              ),
            )),
        BottomButton(
          title: "RE - CALCULATE",
          onClick: () {
            Navigator.pop(context);
          },
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
