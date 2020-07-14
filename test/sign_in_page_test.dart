import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/auth.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/sign_in/sign_in_page.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockAuth extends Mock implements AuthBase {}

class MockNavigator extends Mock implements NavigatorObserver {}

void main() {
  MockAuth mockAuth;
  MockNavigator navigator;
  StreamController<User> onAuthStateChangedStreamController;
  setUp(() {
    mockAuth = new MockAuth();
    navigator = new MockNavigator();
    onAuthStateChangedStreamController = StreamController<User>();
  });

  tearDown(() {
    onAuthStateChangedStreamController.close();
  });

  Future<void> pumpSignInPage(WidgetTester tester) async {
    await tester.pumpWidget(
      Provider<AuthBase>(
        create: (_) => mockAuth,
        child: MaterialApp(
          navigatorObservers: [navigator],
          home: Builder(
            builder: (context) => SignInPage.create(context),
          ),
        ),
      ),
    );
   verify(navigator.didPush(any, any)).called(1);
  }

  testWidgets('navigate to email and signin', (WidgetTester tester) async {
    await pumpSignInPage(tester);

    final button = await find.byKey(Key('email-password'));
    expect(button, findsOneWidget);

    await tester.tap(button);
    await tester.pumpAndSettle();
    verify(navigator.didPush(any, any)).called(1);
  });
}
