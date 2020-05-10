import 'package:flutter/material.dart';
import 'package:lab_examples/appstyles/app_colors.dart';
import 'package:lab_examples/appstyles/app_styles.dart';

class IAMRich extends StatefulWidget {
  @override
  _IAMRichState createState() => _IAMRichState();
}

class _IAMRichState extends State<IAMRich> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: AppStyles.textwidget("I Am Rich",
      fontWeight: FontWeight.w300,
          color: AppColors.white, heightInline: 1.2),
      centerTitle: true,
      backgroundColor: Colors.blueGrey[900],
    );

    final body = Center(
      child: Image(
        image: AssetImage(
            'images/diamond.png'),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: appBar,
      body: body,
    );
  }
}
