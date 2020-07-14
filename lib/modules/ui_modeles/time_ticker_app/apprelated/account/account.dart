import 'package:flutter/material.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/account/avatar.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/platform_aware_dialog.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/auth.dart';
import 'package:provider/provider.dart';

class Accountpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);
    final AppBar appBar = AppBar(
      title: AppStyles.textwidget(
        'Accounts',
        color: AppColors.white,
      ),
      centerTitle: true,
      actions: <Widget>[
        FlatButton(
          onPressed: () => _comfirmSignzOut(context),
          child: AppStyles.textwidget(
            'Logout',
            fontSize: 18,
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: _buildUserInfo(user),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(),
    );
  }

  Widget _buildUserInfo(User user) {
    return Column(
      children: <Widget>[
        Avatar(
          photoUrl: user.displayUrl,
          radius: 50,
        ),
        SizedBox(
          height: 8,
        ),
        if (user.displayName != null) ...[
          AppStyles.textwidget(user.displayName),
          SizedBox(
            height: 8,
          ),
        ]
      ],
    );
  }

  Future<void> _comfirmSignzOut(BuildContext context) async {
    final authBase = Provider.of<AuthBase>(context, listen: false);

    final response = await PlatformAwareDialog(
      title: 'Logout',
      content: 'Are you sure, you want to logout?',
      defaultText: 'Logout',
      cancelActionText: 'cancel',
    ).show(context);

    if (response != null && response) {
      _signOutWithAnonymously(authBase);
    }
  }

  Future<void> _signOutWithAnonymously(AuthBase authBase) async {
    try {
      await authBase.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
