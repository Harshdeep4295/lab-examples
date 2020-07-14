import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/platform_aware_dialog.dart';

class PlatformExceptionAlertDialog extends PlatformAwareDialog {
  final String title;
  final PlatformException exception;
  PlatformExceptionAlertDialog({
    @required this.title,
    @required this.exception,
  }) : super(
          title: title,
          content: _message(exception),
          defaultText: 'okay',
        );

  static String _message(PlatformException exception) {
    return _errors[exception.code] ?? exception.message;
  }

  static Map<String, String> _errors = {
    'ERROR_WEAK_PASSWORD': 'Weak Passowrd',
    'ERROR_INVALID_EMAIL': 'Invalid Email ID',
    'ERROR_EMAIL_ALREADY_IN_USE': 'Email already in use',
    'ERROR_WRONG_PASSWORD': 'Wrong password',
    'ERROR_USER_NOT_FOUND': 'User not found for email',
    'ERROR_USER_DISABLED': 'User is diabled for login',
    'ERROR_TOO_MANY_REQUESTS':
        ' To many attempts, please try later after some time.'
  };
}
