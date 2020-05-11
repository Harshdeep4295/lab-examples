import 'package:flutter/material.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';

class IconButtons extends StatelessWidget {
  final Function onPressed;
  final IconData child;

  const IconButtons({Key key, this.onPressed, this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(child),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: AppColors.fillColorButton,
    );
  }
}
