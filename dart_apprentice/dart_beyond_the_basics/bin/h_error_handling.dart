//Stack Trace help to locate the area where the error occured
//some errors can be tracked down using the stacktrace, breakpoints when run in
//debug mode, the watch in the debug section.
//Some errors can't be handled, i.e. from the outside world hence need code
//to handle them.

import 'dart:convert';

void main() {
// using the catch block, the app doesn't crash, but exceptions are neglected
  final json = 'abc';
  try {
    final jsonFormat = jsonDecode(json);
    print(jsonFormat);
  } catch (e) {
    print('there was an error!');
    print(e);
  }

  //hence use the on keyword to specify the expected exceptions & how to deal
//with them
  final List<String> numberString = ['42', 'hallo!'];
  try {
    for (var integer in numberString) {
      final number = int.parse(integer);
      print(number ~/ 2);
    }
  } on UnsupportedError {
    handleUnsupportedError();
  } on FormatException {
    handleFormatException();
  }
//the specific errors are handled, but other exceptions will still cause a crash

  final database = FakeDataBase();
  database.open();

  try {
    final data = database.fetchData();
    final number = int.parse(data);
    print('The number is $number');
  } on FormatException {
    print('Dart didn\'t recognise the data as a number!');
  } finally {
    database.close();
  }

  //creating custom exceptions
  //One ought to use the standard exceptions as much as possible.
  //But if need be, custom exceptions are created by extending the Exception
  //class

  final password = 'Password';
  try {
    validatePassword(password);
    print('Your password is valid!');
  } on ShortPasswordException catch (e) {
    print(e.message);
  } on NoUpperCaseException catch (e) {
    print(e.message);
  } on NoLowerCaseException catch (e) {
    print(e.message);
  } on NoNumberException catch (e) {
    print(e.message);
  }

  //challenge one
  challenges();
}

void handleUnsupportedError() {
  print('You cannot divide by zero!');
}

void handleFormatException() {
  print('You tried to parse a non integer value!');
}

class FakeDataBase {
  void open() => print('Opening database!');
  void close() => print('Closing Database!');
  String fetchData() => 'forty-two';
}

//custom excption Logic
class ShortPasswordException implements Exception {
  //should contain the field that will hold the message of the exception
  final String message;
  ShortPasswordException(this.message);
}

class NoUpperCaseException implements Exception {
  //should contain the field that will hold the message of the exception
  final String message;
  NoUpperCaseException(this.message);
}

class NoLowerCaseException implements Exception {
  //should contain the field that will hold the message of the exception
  final String message;
  NoLowerCaseException(this.message);
}

class NoNumberException implements Exception {
  //should contain the field that will hold the message of the exception
  final String message;
  NoNumberException(this.message);
}

void validatePassword(String password) {
  validateLength(password);
  validateUpperCase(password);
  validateLowerCase(password);
  validateNumber(password);
}

void validateLength(String password) {
  final goodLength = RegExp(r'.{8,}');
  if (!password.contains(goodLength)) {
    throw ShortPasswordException(
        'Your password must have atleast 8 characters!');
  }
}

void validateUpperCase(String password) {
  final goodLength = RegExp(r'[A-Z]');
  if (!password.contains(goodLength)) {
    throw ShortPasswordException(
        'Your password must contain atleast one uppercase character!');
  }
}

void validateLowerCase(String password) {
  final goodLength = RegExp(r'[a-z]');
  if (!password.contains(goodLength)) {
    throw ShortPasswordException(
        'Your password must contain atleast one lowercase character!');
  }
}

void validateNumber(String password) {
  final goodLength = RegExp(r'[0-9]');
  if (!password.contains(goodLength)) {
    throw ShortPasswordException(
        'Your password must contain atleast one number!');
  }
}

void challenges() {
  challengeOne();
  challengeTwo();
}

//challenge one
void challengeOne() {
  final numbers = ['3', '1E+8', '1.25', '4', '-0.01', 'NaN', 'Infinity'];
  try {
    for (var number in numbers) {
      final myNumber = double.parse(number);
      print(myNumber);
    }
  } on FormatException catch (e) {
    print(e.message);
  }
}

//challenge two
void challengeTwo() {
// Create a custom exception named InvalidPostalCode .
// Validate that a postal code is five digits.
// If it isn’t, throw the exception

  final postalCode = '14229';
  try {
    validatePostalCode(postalCode);
    print('Your postal code has been validated!\nProceeding to the next page!');
  } on InvalidPostalException catch (e) {
    print(e.message);
  }
}

class InvalidPostalException implements Exception {
  final String message;
  InvalidPostalException(this.message);
}

void validatePostalCode(String postalCode) {
  validatePostalCodeLength(postalCode);
  validatePostalCodeCharacters(postalCode);
}

void validatePostalCodeLength(String postalCode) {
  if (postalCode.length != 5) {
    throw InvalidPostalException('Your postal code must have exactly 5 digits');
  }
}

void validatePostalCodeCharacters(String postalCode) {
  final numbers = RegExp(r'[0-9]');
  final lowerCase = RegExp(r'[a-z]');
  final upperCase = RegExp(r'[A-Z]');

  if (!postalCode.contains(numbers) ||
      postalCode.contains(lowerCase) ||
      postalCode.contains(upperCase)) {
    throw InvalidPostalException('Your postal code must contain numbers only!');
  }
}
