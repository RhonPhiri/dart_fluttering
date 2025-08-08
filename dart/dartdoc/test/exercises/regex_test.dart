import 'package:dartdoc/exercises/a.%20regex.dart';
import 'package:test/test.dart';

void main() {
  group('DigitExtractor', () {
    test('"No digits"', () {
      expect(() => digitExtractor("Hello"), prints("[]\n"));
    });
    test('Single digit', () {
      expect(() => digitExtractor("a1b"), prints("[1]\n"));
    });

    test('Multiple digits', () {
      expect(() => digitExtractor("abc123xyz"), prints("[1, 2, 3]\n"));
    });

    test('Digits with spaces', () {
      expect(() => digitExtractor(" 4 5 6 "), prints("[4, 5, 6]\n"));
    });

    test('Digits and special characters', () {
      expect(() => digitExtractor("!7@8#9\$"), prints("[7, 8, 9]\n"));
    });

    test('Empty string', () {
      expect(() => digitExtractor(""), prints("[]\n"));
    });
  });

  group("Email validator", () {
    test('Valid email: 4-letter TLD', () {
      expect(() => emailValidator("john@domain.info"), prints("true\n"));
    });

    test('Valid email: 2-letter TLD', () {
      expect(() => emailValidator("alice@site.co"), prints("true\n"));
    });

    test('Valid email: multi-level TLD', () {
      expect(() => emailValidator("bob@domain.co.za"), prints("true\n"));
    });

    test('Invalid: missing @', () {
      expect(() => emailValidator("userexample.com"), prints("false\n"));
    });

    test('Invalid: missing domain', () {
      expect(() => emailValidator("user@.com"), prints("false\n"));
    });

    test('Invalid: missing TLD', () {
      expect(() => emailValidator("user@domain"), prints("false\n"));
    });

    test('Invalid: TLD too short', () {
      expect(() => emailValidator("user@domain.c"), prints("false\n"));
    });

    test('Invalid: TLD too long', () {
      expect(() => emailValidator("user@domain.abcdef"), prints("false\n"));
    });

    test('Invalid: special chars in local', () {
      expect(() => emailValidator("user.name@domain.com"), prints("false\n"));
    });

    test('Invalid: digits in domain', () {
      expect(() => emailValidator("user@domain123.com"), prints("false\n"));
    });

    test('Invalid: empty string', () {
      expect(() => emailValidator(""), prints("false\n"));
    });
  });

  group('White Space Trimmer', () {
    test('White space at start and end', () {
      expect(() => whiteSpaceTrimmer(" Hello "), prints("true\n"));
    });
  });
  group('whiteSpaceTrimmer', () {
    test('No whitespace', () {
      expect(() => whiteSpaceTrimmer("Hello"), prints("Hello\n"));
    });

    test('Leading whitespace', () {
      expect(() => whiteSpaceTrimmer("   Hello"), prints("Hello\n"));
    });

    test('Trailing whitespace', () {
      expect(() => whiteSpaceTrimmer("Hello   "), prints("Hello\n"));
    });

    test('Leading and trailing whitespace', () {
      expect(() => whiteSpaceTrimmer("   Hello   "), prints("Hello\n"));
    });

    test('Whitespace only', () {
      expect(() => whiteSpaceTrimmer("     "), prints("\n"));
    });

    test('Tabs and newlines', () {
      expect(
        () => whiteSpaceTrimmer("\t\n  Hello World  \n\t"),
        prints("Hello World\n"),
      );
    });

    test('Whitespace in the middle', () {
      expect(
        () => whiteSpaceTrimmer("Hello   World"),
        prints("Hello   World\n"),
      );
    });

    test('Empty string', () {
      expect(() => whiteSpaceTrimmer(""), prints("\n"));
    });
  });
  group('dateFormatter', () {
    test('Single date in text', () {
      expect(
        () => dateFormatter("Due: 07/18/2025"),
        prints("Due: 2025-18-07\n"),
      );
    });

    test('Date at the start', () {
      expect(
        () => dateFormatter("12/31/2024 is New Year\'s Eve"),
        prints("2024-31-12 is New Year's Eve\n"),
      );
    });

    test('Date at the end', () {
      expect(
        () => dateFormatter("Event on 03/01/2023"),
        prints("Event on 2023-01-03\n"),
      );
    });

    test('Multiple dates in text', () {
      // Note: Your function prints once for each match, replacing all matches each time.
      expect(
        () => dateFormatter("Start: 01/01/2023, End: 12/31/2023"),
        prints(
          "Start: 2023-01-01, End: 12/31/2023\nStart: 01/01/2023, End: 2023-31-12\n",
        ),
      );
    });

    test('No date in text', () {
      expect(() => dateFormatter("No date here!"), prints(""));
    });

    test('Short year (2 digits)', () {
      expect(
        () => dateFormatter("Old date: 07/04/76"),
        prints("Old date: 76-04-07\n"),
      );
    });

    test('Date with extra spaces', () {
      expect(
        () => dateFormatter("  Date: 09/09/1999  "),
        prints("  Date: 1999-09-09  \n"),
      );
    });
  });
}
