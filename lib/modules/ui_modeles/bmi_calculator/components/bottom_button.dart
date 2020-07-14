import 'package:flutter/material.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final Function onClick;
  const BottomButton({
    Key key, this.title, this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: AppStyles.height(60),
        padding: EdgeInsets.only(bottom: AppStyles.width(15)),
        margin: EdgeInsets.only(top: AppStyles.width(10)),
        color: AppColors.pinkDarkColor,
        child: Center(
          child: AppStyles.textwidget(title,
              fontSize:  25,
              color: AppColors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
