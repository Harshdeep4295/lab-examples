import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/custom_raised_button.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/auth.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/sign_in/email_sign_in_form.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/sign_in/email_sign_in_form_stateful.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockAuth extends Mock implements AuthBase {}

void main() {
  MockAuth mockAuth;

  setUpAll(() {
    mockAuth = new MockAuth();
  });

  Future<void> pumpEmailSignInForm(WidgetTester tester) async {
    await tester.pumpWidget(
      Provider<AuthBase>(
        create: (_) => mockAuth,
        child: MaterialApp(
          home: Scaffold(
            body: EmailSignInFormStateful(),
          ),
        ),
      ),
    );
  }

  void stubSignin() {
    when(
      mockAuth.createInWithEmailAndPassword(any, any),
    ).thenAnswer(
      (_) => Future<User>.value(
        User(uid: 'abc'),
      ),
    );
  }

  group('Sign in', () {
    testWidgets('Sign in is not called', (WidgetTester tester) async {
      await pumpEmailSignInForm(tester);
      final register = await find.text('Sign in');
      await tester.tap(register);
      verifyNever(
        mockAuth.signInWithEmailAndPassword(any, any),
      );
    });
    
    testWidgets('Sign in is called', (WidgetTester tester) async {
      await pumpEmailSignInForm(tester);

      const email = 'email@email.com';
      const password = 'password';

      final emailField = await find.byKey(Key('email'));
      expect(emailField, findsOneWidget);
      await tester.enterText(emailField, email);

      final passwordField = await find.byKey(Key('password'));
      expect(passwordField, findsOneWidget);
      await tester.enterText(passwordField, password);

      await tester.pump(Duration(seconds: 2));
      final emailField2 = await find.text(email);
      expect(emailField2, findsOneWidget);
      // await tester.enterText(emailField, email);
      await tester.pumpAndSettle();
      final signInbutton = await find.byType(CustomRaisedButton);
      expect(signInbutton, findsOneWidget);
      await tester.tap(signInbutton);
      verify(
        mockAuth.signInWithEmailAndPassword(email, password),
      ).called(1);
    });
  });

  group('register', () {
    testWidgets('Sign in is not called', (WidgetTester tester) async {
      await pumpEmailSignInForm(tester);
      final register = await find.text('Need an account? Register');
      await tester.tap(register);
      await tester.pump();
      verifyNever(
        mockAuth.createInWithEmailAndPassword(any, any),
      );
    });

    testWidgets('Sign in is called', (WidgetTester tester) async {
      await pumpEmailSignInForm(tester);
      stubSignin();
      final register = await find.text('Need an account? Register');
      await tester.tap(register);
      await tester.pump();

      const email = 'email@email.com';
      const password = 'password';

      final emailField = await find.byKey(Key('email'));
      expect(emailField, findsOneWidget);
      await tester.enterText(emailField, email);

      final passwordField = await find.byKey(Key('password'));
      expect(passwordField, findsOneWidget);
      await tester.enterText(passwordField, password);

      await tester.pump();

      final signInbutton = await find.text('Create an account');
      expect(signInbutton, findsOneWidget);
      await tester.tap(signInbutton);
      // await mockAuth.signInWithEmailAndPassword(email, password);
      verify(mockAuth.createInWithEmailAndPassword(email, password)).called(1);
    });
  });
}
