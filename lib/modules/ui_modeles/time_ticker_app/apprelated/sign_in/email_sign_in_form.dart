import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/form_submit_button.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/platform_exception_alert_dialog.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/auth.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/sign_in/email_sign_in_bloc.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/sign_in/model/email_sign_in_model.dart';
import 'package:provider/provider.dart';

class EmailSignInForm extends StatefulWidget {
  EmailSignInForm({@required this.emailSignInBloc});

  final EmailSignInBloc emailSignInBloc;

  static Widget create(BuildContext context) {
    return Provider<EmailSignInBloc>(
      create: (_) => EmailSignInBloc(authBase: Auth()),
      dispose: (context, bloc) => bloc.dispose(),
      child: Consumer<EmailSignInBloc>(
        builder: (context, bloc, _) => EmailSignInForm(
          emailSignInBloc: bloc,
        ),
      ),
    );
  }

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailTextController =
      new TextEditingController();

  final TextEditingController _passwordTextController =
      new TextEditingController();

  String get email => _emailTextController.text.toString().trim();

  String get password => _passwordTextController.text.toString().trim();

  final FocusNode _emailFocusNode = FocusNode();

  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EmailSignInModel>(
        stream: widget.emailSignInBloc.modelStream,
        initialData: EmailSignInModel(),
        builder: (context, snapshot) {
          print('${snapshot.data.password}');
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _buildChild(context, snapshot.data),
            ),
          );
        });
  }

  List<Widget> _buildChild(BuildContext context, EmailSignInModel model) {
    return [
      _emailTextField(context, model),
      SizedBox(
        height: 8.0,
      ),
      _passwordTextField(model),
      SizedBox(
        height: 8.0,
      ),
      FormSubmitButton(
        text: model.primaryButtonText,
        onPressed: model.canSubmit && !model.isLoading ? _submit : null,
      ),
      SizedBox(
        height: 8.0,
      ),
      FlatButton(
        textColor: AppColors.black,
        onPressed: !model.isLoading ? () => _toggleFormType() : null,
        child: Text(model.secondaryButtontext),
      ),
      SizedBox(
        height: 8.0,
      ),
    ];
  }

  TextField _passwordTextField(EmailSignInModel model) {
    return TextField(
      obscureText: true,
      focusNode: _passwordFocusNode,
      enabled: !model.isLoading,
      controller: _passwordTextController,
      decoration: InputDecoration(
        hoverColor: AppColors.fillColorButton,
        labelText: 'Password',
        // hintText: 'test@test.com',
        hintStyle: AppStyles.textStyle(AppColors.greyLight, 18),
        labelStyle: AppStyles.textStyle(AppColors.greyLight, 18),
        errorText: model.showErrorTextPassword,
      ),
      onEditingComplete: widget.emailSignInBloc.submit,
      onChanged: widget.emailSignInBloc.updatePassword,
    );
  }

  TextField _emailTextField(BuildContext context, EmailSignInModel model) {
    return TextField(
      controller: _emailTextController,
      focusNode: _emailFocusNode,
      enabled: !model.isLoading,
      onEditingComplete: () => _emailEditingComplete(context, model),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hoverColor: AppColors.fillColorButton,
        labelText: 'Email',
        hintText: 'test@test.com',
        errorText: model.showErrorTextEmail,
        hintStyle: AppStyles.textStyle(AppColors.greyLight, 18),
        labelStyle: AppStyles.textStyle(AppColors.greyLight, 18),
      ),
      onChanged: widget.emailSignInBloc.updateEmail,
    );
  }

  void _emailEditingComplete(BuildContext context, EmailSignInModel model) {
    final newFocus = model.emailStringValidator.isValid(email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _toggleFormType() {
    widget.emailSignInBloc.toggleFormType();
    _emailTextController.clear();
    _passwordTextController.clear();
  }

  Future<void> _submit() async {
    try {
      await widget.emailSignInBloc.submit();
    } on Exception catch (ex) {
      final result = await PlatformExceptionAlertDialog(
        title: 'Sign in failed',
        exception: ex,
      ).show(context);
      print(result);
    }
  }
}
