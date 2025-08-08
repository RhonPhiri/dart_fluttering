//RegExp => These enable complex matching patterns. Used in string validation

void regExpression() {
  final regExp = RegExp("cat");

  //Checks if the input int the hasmatch method contains a pattern arrangement of characters similar to the variable
  print(regExp.hasMatch("concatation"));
  //Another way is the following
  print("concatation".contains(regExp));

  //RegExps use special characters that define constraints for matching strings
  //The "." matches any one character
  specialCharacter("Dot");

  //To match any single or no character, follow the dot with a question mark ".?"
  specialCharacter("NullableDot");

  //To match one or more of a certain character, follow the character with a "+"
  specialCharacter("MultipleOne");

  //To match zero or one or more of a certain character, follow the character with an asterisk "*"
  specialCharacter("NullableMultipleOne");

  //To match multiple of any character, follow the "." with a "+" or "*"
  specialCharacter("NullableMultiple");

  //To match any one of a specified set of characters, use the square brankets. Only one character in the set is matched, not both or none
  specialCharacter("SpecificSet");

  //To match a character in a specified range
  specialCharacter("SpecificRange");

  //Not to match any one character except for those contained in a set
  specialCharacter("AvoidSpecificSet");

  //Use raw strings "r" to escape special characters
  specialCharacter("RawRegExp");

  //Checking if a text contains numbers only
  specialCharacter("NumbersOnly");

  //Validating a password, should have at least one LowerCase, UpperCase & Nummber. It should also have at least 8 characters
  validatePassword("heyO1kjsdkjfh");

  //Extract text using regexp
  extractText('''
<h1>Dart Tutorial</h1>
<h1>Flutter Tutorial</h1>
<h1>Other Tutorials</h1>
''');

  //Challenge 1, validating an email address
  validateEmail("k@gmail.com");

  //Challenge 2
  mapLyrics("[00:12.34]Row, row, row your boat");
}

void specialCharacter(String title) {
  late RegExp regExp;
  late List<String> tests;
  switch (title) {
    case "Dot":
      regExp = RegExp("c.t");
      tests = ["cut", "cat", "ct"];
      break;
    case "NullableDot":
      regExp = RegExp("c.?t");
      tests = ["cut", "cat", "ct"];
      break;
    case "MultipleOne":
      regExp = RegExp("co+l");
      tests = ["cl", "col", "cool", "coal"];
      break;

    case "NullableMultipleOne":
      regExp = RegExp("co*l");
      tests = ["cl", "col", "cool", "coal"];
      break;

    case "NullableMultiple":
      regExp = RegExp("c.*l");
      tests = ["cl", "col", "cool", "coal"];
      break;

    case "SpecificSet":
      regExp = RegExp("b[oa]t");
      tests = ["bot", "bat", "boat", "bt"];
      break;

    case "SpecificRange":
      regExp = RegExp("[a-zA-Z]");
      tests = ["a", "H", "3a", "3"];
      break;

    case "AvoidSpecificSet":
      regExp = RegExp("b[^oa]t");
      tests = ["bot", "bat", "boat", "bt", "bet", "beat"];
      break;
    case "RawRegExp":
      regExp = RegExp(r"c\.t");
      tests = ["ct", "c.t", r"c\t", r"c\.t", "cat"];
      break;
    case "NumbersOnly":
      //The "^" character, matches the beginning of a text starts with the charcter proceeding "^"
      //The "$" character, matches the ending of a text
      regExp = RegExp(r"^[0-9]+$");
      tests = ["", "2", "1b", "23"];
      break;
  }
  for (var i = 0; i < tests.length; i++) {
    print("${regExp.toString()} ${tests[i]}: ${regExp.hasMatch(tests[i])}");
  }
}

void validatePassword(String password) {
  final lowerCase = RegExp(r"[a-z]");
  final upperCase = RegExp("[A-Z]");
  final number = RegExp(r"[0-9]");
  //The curly braces specify the range. {10} means exactly 10 characters, {10,} means at least 10, {10,12} means 10-12
  final length = RegExp(r".{8,}");

  if (!password.contains(upperCase)) {
    print("Your password must have at least one upperCase character!");
  } else if (!password.contains(lowerCase)) {
    print("Your password must have at least one lowerCase character!");
  } else if (!password.contains(number)) {
    print("Your password must have at least one number character!");
  } else if (!password.contains(length)) {
    print("Your password must have at least 8 characters!");
  } else {
    print("Your password is okay!");
  }
}

void extractText(String text) {
  final headings = RegExp(r"<h1>(.+)</h1>");

  final matches = headings.allMatches(text);
  for (var match in matches) {
    print(match.group(1));
  }
}

///challenge 1
void validateEmail(String email) {
  final validator = RegExp(r"^[a-zA-Z0-9.%_+-]+@gmail\.com$");
  print(validator.hasMatch(email));
}

void mapLyrics(String lyrics) {
  final timeExtract = RegExp(r"\[(\d{2}):(\d{2})\.(\d{2})](.+)");
  final matches = timeExtract.allMatches(lyrics);
  for (var match in matches) {
    //group 1 means, anything matched with the first braces in my regular expression
    print("minutes: ${match.group(1)}");
    //group 2 means,  anything matched with the first braces in my regular expression
    print("seconds: ${match.group(2)}");
    //group 2 means,  anything matched with the first braces in my regular expression
    print("hundreds ${match.group(3)}");
    //group 2 means,  anything matched with the first braces in my regular expression
    print("lyrics: ${match.group(4)?.trim()}");
  }
}
