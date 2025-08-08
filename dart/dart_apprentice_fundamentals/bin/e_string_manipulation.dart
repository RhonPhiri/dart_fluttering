//STRING MANIPULATION

void main() {
  basicStringManipulation();
  splitAndJoinStrings();
  replacingStrings();
  splitExercise();
  introducingBuffers();
  bufferInForLoop();
  stringBufferExercise();
  stringValidation();
  subString();
  stringValidationExercise(email: 'PhiriRhon42@gmail.com');
}

void basicStringManipulation() {
  const email = 'PhiriRhon42@gmail.com';

  //use toUpperCase & toLowerCase methods to change cases
  final lowerCase = email.toLowerCase();
  print(lowerCase);
  //
  //use trim method to remove white space @ the start/end of string
  final spacedEmail = ' mrphirirhon42@gmail.com   ';
  print(spacedEmail);
//
  //use padding to add characters/ white space in a string
  //Duration time = Duration(hours: 1, minutes: 20, seconds: 47);
  Duration time = Duration(hours: 1, minutes: 2, seconds: 3);

  final hours = '${time.inHours}'.padLeft(2, '0');
  final minutes = "${time.inMinutes % 60}".padLeft(2, '0');
  final seconds = "${time.inSeconds % 60}".padLeft(2, '0');
  final timeStamp = '$hours:$minutes:$seconds';
  print(timeStamp);
}

void splitAndJoinStrings() {
  //Comma Seperated Values (CSV) file contain data (AKA fields)
  //seperated by comma
  //spliting such the fields, form a string that can be accessed
  const csvFile = 'Martin,Emma,12,Paris,France';
  final fields = csvFile.split(',');
  final firstUserSurname = fields[0];
  print(firstUserSurname);

  //joining strings in a list/any fomart format to a CSV string
  final csvFileFromList = fields.join('-');
  print(csvFileFromList);
}

void replacingStrings() {
  final sentence = 'Learning dart for flutter';
  final newSentence = sentence.replaceAll(' ', '_');
  print(newSentence);
}

void splitExercise() {
  //converting this multiline code into a List of string using split.
  const countries =
      'Malawi\nZambia\nZimbabwe\nMozambique\nTanzania\nBotswana\nLesotho\nSouth Africa\nNamibia\nDRC';
  final splitCountries = countries.split('\n');
  print(splitCountries);
}

void introducingBuffers() {
  //Using concantation (+) of one string to another is less efficient
  //as it creates a new object
  //use String buffer instead. convert the contents to a string at the end
  final intro = StringBuffer();
  intro.write('Hi!');
  intro.write(' My name is');
  intro.write(' Rhon Phiri');
}

void bufferInForLoop() {
  final buffer = StringBuffer();
  for (int i = 1; i <= 1024; i *= 2) {
    buffer.write(i);
    buffer.write(' ');
  }
  print(buffer);
}

void stringBufferExercise() {
  final asterisk = StringBuffer();

  for (int i = 1; i <= 10; i++) {
    for (var b = 1; b <= 10; b++) {
      if (b == i) {
        asterisk.write(' ');
      } else {
        asterisk.write('*');
      }
    }
    asterisk.write('\n');
  }
  print(asterisk);
}

void stringValidation() {
  // //String validation=> verifying that a string is in a proper form
  // const text = 'I love Dart!';

  // //use startswith() to check the starting of astring (function returns a bool)
  // print(text.startsWith('I'));
  // //use endswith() to chech the ending of a string
  // print(text.endsWith('dart'));
  // //use contains() to check the middle contents of a string
  // print(text.contains('love'));

  regularExpressions();
}

void regularExpressions() {
  //Regular Expression (RegExp)
  //used to compare the contents between a set of texts
  RegExp regex = RegExp('cat');
  final input = 'catch';
  print(regex.hasMatch(input));
  print(input.contains(regex));
  //use the '.' character to represent any one character
  RegExp aRegEx = RegExp('c.t');
  print(aRegEx.hasMatch('cet'));
  //use the '?' after '.' character to represent zero/ one character
  RegExp bRegEx = RegExp('c.?t');
  print(bRegEx.hasMatch('ct'));
  //use '+' to show that the character it follows can be repeated one/ more times
  RegExp cRegEx = RegExp('wo+w');
  print(cRegEx.hasMatch('wow'));
  print(cRegEx.hasMatch('woooow'));
  print(cRegEx.hasMatch('ww'));
  //use '*' to show that the character it folows can be repeated zero/ more times
  RegExp dRegExp = RegExp('wo*w');
  print(dRegExp.hasMatch('wow'));
  print(dRegExp.hasMatch('woooow'));
  print(dRegExp.hasMatch('ww'));
  dRegExp = RegExp('w.*');
  print(dRegExp.hasMatch('widow'));
  //use charaters wrapped in the square blackets to indicate the no.
  //of characters that can be selected one at a time not all
  RegExp eRegExp = RegExp('R[ho]n');
  print(eRegExp.hasMatch('Rhn'));
  print(eRegExp.hasMatch('Rhon'));
  //Also ranges can be specified
  eRegExp = RegExp('R[h-o]n');
  print(eRegExp.hasMatch('Rin'));
  //complement => ^  ;;; means match characters except those preceded by ^
  eRegExp = RegExp('R[^(h-o)]n');
  print(eRegExp.hasMatch('Ran'));
  print(eRegExp.hasMatch('Ron'));

  //exercise
  const creditCard = '10089994133';

  final number = RegExp(r'^[0-9]+$');
  if (!creditCard.contains(number)) {
    print('your credit number must not contain any letters!');
  } else if (creditCard.length < 10) {
    print('your credit card must have at least 10 characters!');
  } else {
    print('your credit card is valid');
  }
}

void subString() {
  //extraction of a section of a string use substring/ regexp groups
  const htmlText = '''
!DOCTYPE html>
<html>
<body>
<h1>Dart Tutorial</h1>
<p>Dart is my favorite language.</p>
</body>
</html>
''';
//the substring method requires the range inwhich the intend text is located
// in between
//find the range by identifying the posotion of the surrounding characters
  final first = htmlText.indexOf('<h1>') + '<h1>'.length;
  final last = htmlText.indexOf('</h1>');
  final extractedText = htmlText.substring(first, last);
  print(extractedText);

  // using regExp groups
  const text = '''
 <h1>Dart Tutorial</h1>
 <h1>Flutter Tutorial</h1>
 <h1>Other Tutorials</h1>
 ''';

  final headings = RegExp(r'<h1>(.+)</h1'); //the (.+) is a regExp group
  final matches = headings.allMatches(text);
  for (var match in matches) {
    print(match.group(1));
  }
}

void stringValidationExercise({required String email}) {
  final upperCase = RegExp(r'[A-Z]');
  final spaces = email.contains(' ');
  if (email.contains(upperCase)) {
    print('Your email must have small letters only!');
  } else if (spaces) {
    print('your email must not contain any spaces!');
  } else {
    print('Your email is valid!');
  }
}
