//Why null safety is important
void charLength() {
  final text = null;
  print(text.length);
}
//Statically typed programming Ls check or infer the types of a variable @ compile time rather than run time.
//Prevents calling of certain methods or perfoming certain actions @ compile time so that the program doesn;t crush @ runtime
//NULL is important because it indicates the absence of value. Soundness involves declaring explicitly the tpe of a variable & whether it is nullabe or not.

//Type promotion allows some methods to be accessed as bellow
// With (or without) null safety:
bool isEmptyList(Object object) {
  if (object is List) {
    return object.isEmpty; // <-- OK!
  } else {
    return false;
  }
}

//If a variable is allowed to be null, it can checked using the null aware & assertion operators "?. ?.., !, etc"
//If a variable cannot take a variable of null, then use the late variable to allow late initialization & lazy loading

void nullSafety() {
  charLength();
}
