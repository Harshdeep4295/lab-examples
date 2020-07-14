import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/home/home_page.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/services/auth.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/sign_in/sign_in_page.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/landing_screen.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockAuth extends Mock implements AuthBase {}

void main() {
  MockAuth mockAuth;
  StreamController<User> onAuthStateChangedStreamController;
  setUp(() {
    mockAuth = new MockAuth();
    onAuthStateChangedStreamController = StreamController<User>();
  });

  tearDown(() {
    onAuthStateChangedStreamController.close();
  });

  Future<void> pumpUpLandingPage(WidgetTester tester) async {
    await tester.pumpWidget(
      Provider<AuthBase>(
        create: (_) => mockAuth,
        child: MaterialApp(
          home: Scaffold(
            body: LandingPage(),
          ),
        ),
      ),
    );
    await tester.pump();
  }

  void stubOnAuthChanged(Iterable<User> onAuthChanged) {
    onAuthStateChangedStreamController
        .addStream(Stream<User>.fromIterable(onAuthChanged));
    when(mockAuth.onAuthStateChanged).thenAnswer((realInvocation) {
      return onAuthStateChangedStreamController.stream;
    });
  }

  testWidgets('null user', (WidgetTester tester) async {
    stubOnAuthChanged([null]);
    await pumpUpLandingPage(tester);

    expect(find.byType(SignInPage), findsOneWidget);
  });

  testWidgets('stream waiting', (WidgetTester tester) async {
    stubOnAuthChanged([]);
    await pumpUpLandingPage(tester);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('user', (WidgetTester tester) async {
    stubOnAuthChanged([User(uid: '123213')]);
    await pumpUpLandingPage(tester);

    expect(find.byType(HomePage), findsOneWidget);
  });
}
