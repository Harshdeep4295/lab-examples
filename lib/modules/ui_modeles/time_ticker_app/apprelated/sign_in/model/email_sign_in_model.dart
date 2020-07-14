import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/sign_in/validator.dart';

enum EmailSignInType { signIn, register }

class EmailSignInModel with EmailAndPasswordValidator {
  EmailSignInModel({
    this.email = "",
    this.password = "",
    this.isLoading = false,
    this.isSubmitted = false,
    this.formType = EmailSignInType.signIn,
  });

  final String email;
  final String password;
  final bool isLoading;
  final bool isSubmitted;
  final EmailSignInType formType;

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

  EmailSignInModel copyWith({
    String email,
    String password,
    bool isLoading,
    bool isSubmitted,
    EmailSignInType formType,
  }) {
    return EmailSignInModel(
        email: email ?? this.email,
        password: password ?? this.password,
        isLoading: isLoading ?? this.isLoading,
        isSubmitted: canSubmit ?? this.isSubmitted,
        formType: formType ?? this.formType);
  }
}
