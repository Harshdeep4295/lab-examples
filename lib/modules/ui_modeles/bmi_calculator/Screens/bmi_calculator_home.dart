import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';
import 'package:lab_experiments/appstyles/app_constants.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';
import 'package:lab_experiments/modules/ui_modeles/bmi_calculator/Screens/bmi_calculator_result.dart';
import 'package:lab_experiments/modules/ui_modeles/bmi_calculator/calculator_brain.dart';
import 'package:lab_experiments/modules/ui_modeles/bmi_calculator/components/bottom_button.dart';
import 'package:lab_experiments/modules/ui_modeles/bmi_calculator/components/icon_button.dart';
import 'package:lab_experiments/modules/ui_modeles/bmi_calculator/components/icon_text_widget.dart';
import 'package:lab_experiments/modules/ui_modeles/bmi_calculator/components/reuasable_card.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  GENDER selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: AppStyles.textwidget("BMI Calculator",
          fontWeight: FontWeight.w300,
          color: AppColors.white,
          heightInline: 1.2),
      centerTitle: true,
    );

    final body = SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onClick: () => updateCardColor(GENDER.MALE),
                  bgColor: selectedGender == GENDER.MALE
                      ? AppColors.activeCard
                      : AppColors.inActiveCard,
                  child: IconTextWidget(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onClick: () => updateCardColor(GENDER.FEMALE),
                  bgColor: selectedGender == GENDER.FEMALE
                      ? AppColors.activeCard
                      : AppColors.inActiveCard,
                  child: IconTextWidget(
                    icon: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AppStyles.textwidget("HEIGHT",
                    fontSize: AppStyles.fontSize(18),
                    color: AppColors.greyLight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    AppStyles.textwidget(height.toString(),
                        fontSize: AppStyles.fontSize(50),
                        color: AppColors.white,
                        fontWeight: FontWeight.w900),
                    AppStyles.textwidget("cm",
                        fontSize: AppStyles.fontSize(18),
                        color: AppColors.greyLight)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: AppColors.white,
                      thumbColor: AppColors.pinkDarkColor,
                      inactiveTrackColor: AppColors.inactiveIndicator,
                      overlayColor: AppColors.pinkDarkColor.withAlpha(0x29),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AppStyles.textwidget("WEIGHT",
                        fontSize: AppStyles.fontSize(18),
                        color: AppColors.greyLight),
                    SizedBox(
                      height: AppStyles.height(10),
                    ),
                    AppStyles.textwidget(weight.toString(),
                        fontSize: AppStyles.fontSize(50),
                        color: AppColors.white,
                        fontWeight: FontWeight.w900),
                    SizedBox(
                      height: AppStyles.height(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButtons(
                            child: FontAwesomeIcons.minus,
                            onPressed: () {
                              if (weight != 0)
                                setState(() {
                                  weight--;
                                });
                            }),
                        SizedBox(
                          width: 5,
                        ),
                        IconButtons(
                            child: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            }),
                      ],
                    )
                  ],
                )),
              ),
              Expanded(
                child: ReusableCard(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AppStyles.textwidget("AGE",
                        fontSize: AppStyles.fontSize(18),
                        color: AppColors.greyLight),
                    SizedBox(
                      height: AppStyles.height(10),
                    ),
                    AppStyles.textwidget(age.toString(),
                        fontSize: AppStyles.fontSize(50),
                        color: AppColors.white,
                        fontWeight: FontWeight.w900),
                    SizedBox(
                      height: AppStyles.height(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButtons(
                            child: FontAwesomeIcons.minus,
                            onPressed: () {
                              if (age != 0)
                                setState(() {
                                  age--;
                                });
                            }),
                        SizedBox(
                          width: 5,
                        ),
                        IconButtons(
                            child: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            }),
                      ],
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
        BottomButton(
          title: "CALCULATE",
          onClick: () {
            CalculatorBrain brain = new CalculatorBrain(height, weight, age);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BMIResultPage(
                  score: brain.calculateBMI(),
                  result: brain.getResult(),
                  description: brain.getDescription(),
                ),
              ),
            );
          },
        )
      ],
    ));

    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }

  void updateCardColor(GENDER value) {
    setState(() {
      selectedGender = value;
    });
  }
}
