import 'package:flutter/material.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconTextWidget({
    Key key,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: AppStyles.width(80),
        ),
        SizedBox(
          height: AppStyles.height(15),
        ),
        AppStyles.textwidget(text,
            fontSize:  18, color: AppColors.greyLight)
      ],
    );
  }
}
