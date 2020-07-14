import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/auth.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/sign_in/model/email_sign_in_model.dart';

class EmailSignInBloc {
  EmailSignInBloc({@required this.authBase});
  final AuthBase authBase;

  final StreamController<EmailSignInModel> _modelController =
      StreamController<EmailSignInModel>();

  Stream<EmailSignInModel> get modelStream => _modelController.stream;

  EmailSignInModel _emailSignInModel = new EmailSignInModel();

  void updateEmail(String value) => updateWith(email: value);
  void updatePassword(String value) => updateWith(password: value);

  void dispose() {
    _modelController.close();
  }

  void updateWith({
    String email,
    String password,
    bool isLoading,
    bool isSubmitted,
    EmailSignInType formType,
  }) {
    // update model & add to stream.
    _emailSignInModel = _emailSignInModel.copyWith(
      email: email,
      password: password,
      isLoading: isLoading,
      isSubmitted: isSubmitted,
      formType: formType,
    );
    _modelController.sink.add(_emailSignInModel);
  }

  Future<void> submit() async {
    updateWith(isLoading: true, isSubmitted: true);

    try {
      final user = _emailSignInModel.formType == EmailSignInType.register
          ? await authBase.createInWithEmailAndPassword(
              _emailSignInModel.email, _emailSignInModel.password)
          : await authBase.signInWithEmailAndPassword(
              _emailSignInModel.email, _emailSignInModel.password);
      print(user);
    } on Exception {
      updateWith(isLoading: false);
      rethrow;
      
    }
  }

  void toggleFormType() {
    updateWith(
        formType: _emailSignInModel.formType == EmailSignInType.register
            ? EmailSignInType.signIn
            : EmailSignInType.register,
        email: '',
        password: '',
        isSubmitted: false);
  }
}
