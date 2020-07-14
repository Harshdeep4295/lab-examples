import 'package:flutter/material.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/custom_raised_button.dart';

class SingleSignInButton extends CustomRaisedButton {
  SingleSignInButton({
    @required key,
    Color color,
    Color textColor,
    @required String text,
    Function onPressed,
  }) : super(
          key: key,
          child: AppStyles.textwidget(text, color: textColor, fontSize: 15.0),
          color: color,
          onPressed: onPressed,
        );
}
