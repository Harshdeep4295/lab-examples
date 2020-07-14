import 'package:flutter/material.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton(
      {Color color,
      Color textColor,
      @required String text,
      Function onPressed,
      @required String imageName})
      : assert(text != null),
        super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(imageName),
              AppStyles.textwidget(text, color: textColor, fontSize: 15.0),
              Opacity(
                opacity: 0,
                child: Image.asset(imageName),
              ),
            ],
          ),
          color: color,
          onPressed: onPressed,
        );
}
