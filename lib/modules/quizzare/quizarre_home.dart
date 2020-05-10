import 'package:flutter/material.dart';
import 'package:lab_examples/appstyles/app_colors.dart';
import 'package:lab_examples/appstyles/app_styles.dart';
import 'package:lab_examples/modules/quizzare/quiz_page.dart';

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: AppStyles.textwidget("Quizzeler",
          fontWeight: FontWeight.w300,
          color: AppColors.white,
          heightInline: 1.2),
      centerTitle: true,
      backgroundColor: Colors.grey.shade900,
    );
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: appBar,
      body: SafeArea(child: QuizPage()),
    );
  }
}
