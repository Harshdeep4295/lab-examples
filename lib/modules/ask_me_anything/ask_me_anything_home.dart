import 'package:flutter/material.dart';
import 'package:lab_examples/appstyles/app_colors.dart';
import 'package:lab_examples/appstyles/app_styles.dart';
import 'package:lab_examples/modules/ask_me_anything/ball_page.dart';

class AskMeAnything extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: AppStyles.textwidget("Ask Me Anything",
          fontWeight: FontWeight.w300,
          color: AppColors.white,
          heightInline: 1.2),
      centerTitle: true,
      backgroundColor: Colors.blue[900],
    );

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: appBar,
      body: BallPage(),
    );
  }
}
