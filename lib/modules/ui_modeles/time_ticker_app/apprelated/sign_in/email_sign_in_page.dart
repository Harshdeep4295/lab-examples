import 'package:flutter/material.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/sign_in/email_page_change_notifier_form.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      title: AppStyles.textwidget(
        'Time Ticker',
        color: AppColors.white,
      ),
      elevation: 2.0,
      centerTitle: true,
    );
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: AppColors.white,
            child: EmailSignInFormNotifier.create(context), // for change notifier
          ),
        ),
      ),
    );
  }
}
