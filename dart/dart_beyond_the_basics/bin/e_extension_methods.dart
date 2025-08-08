//EXTENSION METHODS
//In flutter, it's common to use classes from the dart core/ packages & not
//necessarilly make them myself
//Extension methods are important in that they allow one to add functionality
//to existing functions that cannot be directly modifiable
//write the extension at the top level of the file.

//I M P O R T A N C E
//1. Cleaner code
//2. no inheritance
//3. Only availeble where the extension is imported

// Other examples in the nah project; hymn_extensions in the utils folder

//Example
//created this code that converts a letter to its proceedence.
//will add it in the String class
String encode(String input) {
  final output = StringBuffer();
  for (var codePoint in input.runes) {
    output.writeCharCode(codePoint + 1);
  }
  return output.toString();
}

//next step is to convert the code above into an extension so as to use it like
//below
// ***final secrete = 'abc'.encoded;*** //
//
extension on String {
  //arrived at the 2 getters below following DRY
  String get encoded => _code(1);
  String get decoded => _code(-1);
  //also note; extensions can't be located inside a function hence written as below;
  //because of get, no parentheses are required
  String _code(int step) {
    final output = StringBuffer();
    //no need to write the input
    //if you want to reference to the input then use 'this'
    for (var codepoint in runes) {
      output.writeCharCode(codepoint + step);
    }
    return output.toString();
  }
}

//int example
extension on int {
  int get cubed => this * this * this;
}

//challenge2 extension
extension on int {
  Duration get minutes => Duration(minutes: this);
}

//challenge1
void challengeOne() {
//decode the ff text from dart
/*'Uif!tfdsfu!up!mfbsojoh!Ebsu!xfmm!jt!up!dg"ewtkqwu"cpf"lwuv"vt{"vjkpiu0"Vlqfh#|rx*uh#uhdglqj#wklv/#wkdw#reylrxvo|
#ghvfulehv#|rx1#Kssh$nsf%'*/
//
//My final Solution
  final decodedDbbSecrete = StringBuffer();
  final dbbSecrete = r'Uif!tfdsfu!up!mfbsojoh!Ebsu!xfmm!jt!up!'.decoded;
  final undecodedText = r'cf!dvsjpvt!boe!kvtu!usz!uijoht/!'.decoded;
  final furtherUndecodedText =
      'Tjodf!zpv(sf!sfbejoh!uijt-!uibu!pcwjpvtmz!eftdsjcft!zpv/!'.decoded;
  final ultimateUndecodedText = 'Hppe!kpc"'.decoded;

  decodedDbbSecrete.writeAll(
      [dbbSecrete, undecodedText, furtherUndecodedText, ultimateUndecodedText]);
  print(decodedDbbSecrete);
}

//challengeTwo
void challengeTwo() {
// Time to Code
// Dart has a Duration class for expressing lengths of time. Make an extension on int so that you can
// express a duration like so:
  final timeRemaining = 3.minutes;
  print(timeRemaining);
}

void main() {
  String text =
      'My name is Rhon Phiri, a 2nd year dental surgery student at Kuhes';
  final secrete = text.encoded;
  print(secrete);
  final original = secrete.decoded;
  print(original);

  int myGrade = 74;
  final secreteGrade = myGrade.cubed;
  print(secreteGrade);

  challengeOne();
  challengeTwo();
}
