import 'package:flutter_test/flutter_test.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/sign_in/validator.dart';

void main() {
  test('Non Empty String', () {
    final validator = NonEmptyStringValidator();
    expect(validator.isValid('email@email.com'), true);
  });

  test('Empty String', () {
    final validator = NonEmptyStringValidator();
    expect(validator.isValid('password'), true);
  });
} 
