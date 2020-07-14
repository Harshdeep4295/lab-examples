import 'package:flutter/material.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';

class CustomRaisedButton extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final Widget child;
  final double borderRadius;
  final double height;
  final Key key;
  const CustomRaisedButton(
      {this.key,
      this.onPressed,
      this.color,
      this.child,
      this.borderRadius = 4.0,
      this.height = 50.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
          color: color,
          onPressed: onPressed,
          disabledColor: AppColors.inactiveIndicator,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
          child: child),
    );
  }
}
