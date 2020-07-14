import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/auth.dart';

class SignInManager {
  final AuthBase authBase;
  final ValueNotifier<bool> isLoading;
  SignInManager({
    @required this.authBase,
    @required this.isLoading,
  });

  // final StreamController<bool> _isLoadingController = StreamController<bool>();

  // Stream<bool> get isStreamLoading => _isLoadingController.stream;

  // void dispose() {
  //   _isLoadingController.close();
  // }

  // void _isLoading(bool value) => _isLoadingController.add(value);

  Future<void> _signIn(Future<User> Function() signInMethod) async {
    isLoading.value = true;
    try {
      return await signInMethod();
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<void> signInWithAnonymously() async => _signIn(
        authBase.signInAnonymously,
      );

  Future<void> signInWithGoogle() async => _signIn(
        authBase.signInWithGoogle,
      );
}
