void regExercise() {
  // digitExtractor("ph1r1rh0n42");
  // emailValidator("phirirhon42@gmail.com");
  // whiteSpaceTrimmer(" Hello ");
  // dateFormatter("Due: 07/18/2025");
  // passwordStrength("k!5kjdfS");
  // hasUpperCase("AKkjas!5S");
  extractHtmlTags('<div>, </a>, <img src="...">');
}

// Digit Extractor
// Goal: Given a string, return a list of all individual digits (0–9) found.
void digitExtractor(String input) {
  //This selects a digit variable. For non digit variabale, r'\D' is used
  final regExp = RegExp(r"\d");
  final digits = regExp.allMatches(input);
  late List digitList = [];
  for (var digit in digits) {
    digitList.add(digit[0]);
  }
  print(digitList);
}

// Simple Email Validator
//     Goal: Write a function that returns true if a string looks like an email in the form local@domain.tld, where:
//         local is one or more letters or digits
//         domain is one or more letters
//         tld is 2–4 letters
void emailValidator(String email) {
  final local = "[a-zA-Z0-9]+";
  final domain = "[a-z]+";
  final tld = r"(\.[a-zA-Z]{2,4})+$";
  final regExp = RegExp('^$local@$domain$tld');
  print(regExp.hasMatch(email));
}

// Whitespace Trimmer
//     Goal: Remove leading and trailing whitespace from a string using a single RegExp replace.
void whiteSpaceTrimmer(String input) {
  final regExp = RegExp(r"^\s+|\s+$"); //The | is OR
  print(input.replaceAll(regExp, ""));
}

// Date Formatter
//     Goal: Convert dates in MM/DD/YYYY format inside a large text to YYYY‑MM‑DD.
//     Example: "Due: 07/18/2025" → "Due: 2025-07-18".
void dateFormatter(String input) {
  final date = RegExp(r"\d{2}/\d{2}/\d{2,4}");
  final matches = date.allMatches(input);
  for (var match in matches) {
    print(
      input.replaceAll(
        match[0].toString(),
        match[0].toString().split("/").reversed.join("-"),
      ),
    );
  }
}

// Password Strength Checker
//     Goal: Return true if a password:
//         Is at least 8 characters,
//         Contains at least one uppercase letter, one lowercase letter, one digit, and one special character (!@#\$%^&*).

void hasUpperCase(String input) {
  final regExp = RegExp(
    r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$%^&*]).{8,}$",
  );
  print(regExp.hasMatch(input));
}

// Extract HTML Tags
//     Goal: From an HTML snippet, find all tag names: e.g. <div>, </a>, <img src="..."> → ['div','/a','img'].

void extractHtmlTags(String input) {
  final regExp = RegExp(r"<(/?(\w+))(>|\s)");
  final matches = regExp.allMatches(input);
  final tagList = [];

  for (var match in matches) {
    tagList.add(match[1]);
  }

  print(tagList);
}
