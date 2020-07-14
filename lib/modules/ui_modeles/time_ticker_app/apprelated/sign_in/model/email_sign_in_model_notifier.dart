import 'package:flutter/foundation.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/auth.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/sign_in/model/email_sign_in_model.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/sign_in/validator.dart';

class EmailSignInChangeModel with EmailAndPasswordValidator, ChangeNotifier {
  EmailSignInChangeModel({
    this.email = "",
    this.password = "",
    this.isLoading = false,
    this.isSubmitted = false,
    this.formType = EmailSignInType.signIn,
    @required this.authBase
  });

  String email;
  String password;
  bool isLoading;
  bool isSubmitted;
  EmailSignInType formType;
  final AuthBase authBase;
  String get primaryButtonText {
    return formType == EmailSignInType.signIn ? 'Sign In' : 'Create an account';
  }

  String get secondaryButtontext {
    return formType == EmailSignInType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign In';
  }

  bool get canSubmit {
    return emailStringValidator.isValid(email) &&
        passwordStringValidator.isValid(password);
  }

  String get showErrorTextPassword {
    return isSubmitted && !passwordStringValidator.isValid(password)
        ? inavlidPasswordText
        : null;
  }

  String get showErrorTextEmail {
    return isSubmitted && !emailStringValidator.isValid(email)
        ? invalidEmail
        : null;
  }

  void updateWith({
    String email,
    String password,
    bool isLoading,
    bool isSubmitted,
    EmailSignInType formType,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.isLoading = isLoading ?? this.isLoading;
    this.isSubmitted = canSubmit ?? this.isSubmitted;
    this.formType = formType ?? this.formType;

    notifyListeners();
  }

  void toggleFormType() {
    updateWith(
        formType: this.formType == EmailSignInType.register
            ? EmailSignInType.signIn
            : EmailSignInType.register,
        email: '',
        password: '',
        isLoading: false,
        isSubmitted: false);
  }

  void updateEmail(String value) => updateWith(email: value);
  void updatePassword(String value) => updateWith(password: value);

  Future<void> submit() async {
    updateWith(isLoading: true, isSubmitted: true);

    try {
      final user = this.formType == EmailSignInType.register
          ? await authBase.createInWithEmailAndPassword(
              this.email, this.password)
          : await authBase.signInWithEmailAndPassword(
              this.email, this.password);
      print(user);
    } on Exception {
      updateWith(isLoading: false);
      rethrow;
    }
  }
}
