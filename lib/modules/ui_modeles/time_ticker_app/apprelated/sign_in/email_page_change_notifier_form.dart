import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab_experiments/appstyles/app_colors.dart';
import 'package:lab_experiments/appstyles/app_styles.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/form_submit_button.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/platform_exception_alert_dialog.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/auth.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/sign_in/model/email_sign_in_model_notifier.dart';
import 'package:provider/provider.dart';

class EmailSignInFormNotifier extends StatefulWidget {
  EmailSignInFormNotifier({@required this.model});

  final EmailSignInChangeModel model;

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider<EmailSignInChangeModel>(
      create: (_) => EmailSignInChangeModel(authBase: Auth()),
      child: Consumer<EmailSignInChangeModel>(
        builder: (context, model, _) => EmailSignInFormNotifier(
          model: model,
        ),
      ),
    );
  }

  @override
  _EmailSignInFormNotifier createState() => _EmailSignInFormNotifier();
}

class _EmailSignInFormNotifier extends State<EmailSignInFormNotifier> {
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildChild(context),
      ),
    );
  }

  List<Widget> _buildChild(BuildContext context) {
    return [
      _emailTextField(context),
      SizedBox(
        height: 8.0,
      ),
      _passwordTextField(),
      SizedBox(
        height: 8.0,
      ),
      FormSubmitButton(
        text: widget.model.primaryButtonText,
        onPressed:
            widget.model.canSubmit && !widget.model.isLoading ? _submit : null,
      ),
      SizedBox(
        height: 8.0,
      ),
      FlatButton(
        textColor: AppColors.black,
        onPressed: !widget.model.isLoading ? () => _toggleFormType() : null,
        child: Text(widget.model.secondaryButtontext),
      ),
      SizedBox(
        height: 8.0,
      ),
    ];
  }

  TextField _passwordTextField() {
    return TextField(
      obscureText: true,
      focusNode: _passwordFocusNode,
      enabled: !widget.model.isLoading,
      controller: _passwordTextController,
      decoration: InputDecoration(
        hoverColor: AppColors.fillColorButton,
        labelText: 'Password',
        // hintText: 'test@test.com',
        hintStyle: AppStyles.textStyle(AppColors.greyLight, 18),
        labelStyle: AppStyles.textStyle(AppColors.greyLight, 18),
        errorText: widget.model.showErrorTextPassword,
      ),
      onEditingComplete: widget.model.submit,
      onChanged: widget.model.updatePassword,
    );
  }

  TextField _emailTextField(
    BuildContext context,
  ) {
    return TextField(
      controller: _emailTextController,
      focusNode: _emailFocusNode,
      enabled: !widget.model.isLoading,
      onEditingComplete: () => _emailEditingComplete(context),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hoverColor: AppColors.fillColorButton,
        labelText: 'Email',
        hintText: 'test@test.com',
        errorText: widget.model.showErrorTextEmail,
        hintStyle: AppStyles.textStyle(AppColors.greyLight, 18),
        labelStyle: AppStyles.textStyle(AppColors.greyLight, 18),
      ),
      onChanged: widget.model.updateEmail,
    );
  }

  void _emailEditingComplete(BuildContext context) {
    final newFocus = widget.model.emailStringValidator.isValid(email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _toggleFormType() {
    widget.model.toggleFormType();
    _emailTextController.clear();
    _passwordTextController.clear();
  }

  Future<void> _submit() async {
    try {
      await widget.model.submit();
    } on Exception catch (ex) {
      final result = await PlatformExceptionAlertDialog(
        title: 'Sign in failed',
        exception: ex,
      ).show(context);
      print(result);
    }
  }
}
