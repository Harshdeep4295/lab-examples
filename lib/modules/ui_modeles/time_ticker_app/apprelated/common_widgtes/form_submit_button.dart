import 'package:flutter/material.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/custom_raised_button.dart';

class FormSubmitButton extends CustomRaisedButton {
  String text;
  Function onPressed;
  FormSubmitButton({
    @required this.text,
     this.onPressed,
  }) : super(
          child: Text(
            text,
            style: AppStyles.textStyle(
              AppColors.white,
              15.0,
            ),
          ),
          height: 44.0,
          color: AppColors.activeCard,
          borderRadius: 4.0,
          onPressed: onPressed,
        );
}
