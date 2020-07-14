import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/home/home_page.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/home/job_page.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/auth.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/database.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/sign_in/sign_in_page.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 480, height: 810, allowFontScaling: true);
    final authBase = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
      stream: authBase.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          return user == null
              ? SignInPage.create(context)
              : Provider<User>.value(
                  value: user,
                  child: Provider<Database>(
                    create: (_) => FirestoreDatabase(uid: user.uid),
                    child: HomePage(),
                  ),
                );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
