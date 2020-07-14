import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/blocs/sign_in_bloc.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/platform_exception_alert_dialog.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/auth.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/sign_in/email_sign_in_page.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/sign_in/sign_in_button.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/sign_in/social_sign_in_button.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final SignInManager manager;
  final bool isLoading;
  const SignInPage({
    Key key,
    this.manager,
    this.isLoading,
  }) : super(key: key);

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) => Provider<SignInManager>(
          create: (_) => SignInManager(
            authBase: Auth(),
            isLoading: isLoading,
          ),
          child: Consumer<SignInManager>(
            builder: (context, manager, _) => SignInPage(
              manager: manager,
              isLoading: isLoading
              .value,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      title: AppStyles.textwidget(
        'Time Ticker',
        color: AppColors.white,
      ),
      elevation: 10,
      centerTitle: true,
    );
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: appBar,
      body: _buildContent(context),
    );
  }

  Widget _buildContent(
    BuildContext context,
  ) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            isLoading
                ? Center(child: SizedBox(child: CircularProgressIndicator()))
                : AppStyles.textwidget(
                    'Sign In',
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
            SizedBox(
              height: 48.0,
            ),
            SocialSignInButton(
              onPressed: () => isLoading ? null : _signInWithGoogle(context),
              text: "Sign In With Google",
              textColor: Colors.black87,
              color: AppColors.white,
              imageName: 'images/google-logo.png',
            ),
            SizedBox(
              height: 8.0,
            ),
            // SocialSignInButton(
            //     onPressed: _signInWithFacebook,
            //     text: "Sign In With Facebook",
            //     textColor: Colors.white,
            //     color: Color(0xFF334d92),
            //     imageName: 'images/facebook-logo.png'),
            // SizedBox(
            //   height: 8.0,
            // ),
            SingleSignInButton(
              key:Key('email-password'),
              onPressed: () => isLoading ? null : _signInWithEmail(context),
              text: "Sign In With Email",
              textColor: Colors.white,
              color: Colors.teal[700],
            ),
            SizedBox(
              height: 8.0,
            ),
            AppStyles.textwidget("Or",
                textAlign: TextAlign.center, fontSize: 14.0),
            SizedBox(
              height: 8.0,
            ),
            SingleSignInButton(
              key:Key('anynomous'),
              onPressed: () =>
                  isLoading ? null : _signInWithAnonymously(context),
              text: "Anonymous Login",
              textColor: Colors.black,
              color: Colors.lime[300],
            ),
          ],
        ),
      ),
    );
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  void showSignInError(context, exception) {
    PlatformExceptionAlertDialog(
      exception: exception,
      title: 'SignIn Failed',
    ).show(context);
  }

  Future<void> _signInWithAnonymously(BuildContext context) async {
    try {
      await manager.signInWithAnonymously();
    } on PlatformException catch (e) {
      showSignInError(context, e);
    } finally {}
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await manager.signInWithGoogle();
    } on PlatformException catch (e) {
      showSignInError(context, e);
    } finally {}
  }
}
