import 'package:flutter/material.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';

class ReusableCard extends StatelessWidget {
  final Widget child;
  final Color bgColor;
  final Function onClick;
  const ReusableCard({
    Key key,
    this.child,
    this.bgColor,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: bgColor != null ? bgColor : AppColors.inActiveCard,
        ),
        child: child,
      ),
    );
  }
}
