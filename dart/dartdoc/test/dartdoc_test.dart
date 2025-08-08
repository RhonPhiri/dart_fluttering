import 'package:dartdoc/c_string_manipulation.dart';
import 'package:test/test.dart';

void main() {
  group('validateEmail', () {
    test('Valid Gmail address', () {
      expect(() => validateEmail('user@gmail.com'), prints('true\n'));
    });
    test('bcom', () {
      expect(() => validateEmail('user@gmailbcom'), prints('false\n'));
    });

    test('Invalid Gmail address (missing @)', () {
      expect(() => validateEmail('usergmail.com'), prints('false\n'));
    });

    test('Invalid Gmail address (wrong domain)', () {
      expect(() => validateEmail('user@yahoo.com'), prints('false\n'));
    });

    test('Empty string', () {
      expect(() => validateEmail(''), prints('false\n'));
    });

    test('Gmail address with subdomain', () {
      expect(() => validateEmail('user@mail.gmail.com'), prints('false\n'));
    });

    test('Gmail address with extra characters', () {
      expect(() => validateEmail('user@gmail.com.org'), prints('false\n'));
    });

    test('Gmail address with numbers', () {
      expect(() => validateEmail('user123@gmail.com'), prints('true\n'));
    });

    test('Gmail address with dots in local part', () {
      expect(() => validateEmail('user.name@gmail.com'), prints('true\n'));
    });
  });
}
