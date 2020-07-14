import 'package:flutter/material.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';

class EmptyContentWidget extends StatelessWidget {
  final String title;
  final String message;
  EmptyContentWidget({
    this.title = 'Nothing here',
    this.message = 'Add item to get started',
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppStyles.textwidget(title,
              fontSize: 32, color: Colors.black54, fontWeight: FontWeight.normal),
          AppStyles.textwidget(message,
              fontSize: 16, color: Colors.black54, fontWeight: FontWeight.normal),
        ],
      ),
    );
  }
}
