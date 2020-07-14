abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class EmailAndPasswordValidator {
  final emailStringValidator = NonEmptyStringValidator();
  final passwordStringValidator = NonEmptyStringValidator();
  final String invalidEmail = 'Email can\'t be empty';
  final String inavlidPasswordText = 'Password can\'t be empty';
}
