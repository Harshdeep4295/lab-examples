import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/common_widgtes/custom_raised_button.dart';

void main() {
  testWidgets('Custom raied button test', (WidgetTester tester) async {
    var pressed = false;
    await tester.pumpWidget(MaterialApp(
        home: CustomRaisedButton(
      child: Text('tap me'),
      onPressed: () => pressed = true,
    )));
    final button = find.byType(RaisedButton);
    expect(button, findsOneWidget);
    expect(find.byType(FlatButton), findsNothing);
    expect(find.text('tap me'), findsOneWidget);
    await tester.tap(button);
     expect(pressed, true);
  });
}
