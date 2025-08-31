void functions() {
  //Positional Parameters
  positional("Rhon", "Phiri");
  //Optional Parameters
  optional("Rhon", "Phiri", "Suzgo");
  //Named Parameters
  namedParameters(firstName: "Rhon", middleName: "Suzgo");
  //Function as a parameter
  const List<int> integers = [1, 3, 5, 7, 9];

  integers.forEach(printElement);

  //Functions as variables
  final passStatus = hasPassed(65);

  print(passStatus);

  //Function types
  g("Rhon", greeting: "timoneni");

  //Lexical Closure
  var add2 = makeAdder(2);
  var add4 = makeAdder(4);

  assert(add2(2) == 4);
  assert(add4(4) == 8);

  //Sync generator
  final squares = squaresTo(10_000);
  squares.forEach(print);
}

//Functions are object of type FUCNTION
//They can be assigned to variables or passed to other functions as parameters
//The shorthand syntax can be used if the contents between the => & the ; evaluates to a value;

//POSITIONAL PARAMETERS; These are required by default
void positional(String firstName, String surname) =>
    print("$firstName $surname");

//OPTIONAL PARAMETERS; These are nullable or else, a default needs to be defined
void optional(String firstName, String surname, [String? middleName]) =>
    print("$firstName $middleName $surname");

//NAMED PARAMETERS; These are optional unless preceeded by the required keyword.Hence nullable, unless a default is provided.
void namedParameters({
  required String firstName,
  String middleName = "",
  String lastName = "",
}) => print("$firstName $middleName $lastName");

//FUNCTIONS AS PARAMETERS TO OTHER FUNCTIONS
void printElement<T>(T element) => print(element);

//ASSIGNING FUNCTIONS TO VARIABLES
bool hasPassed(int grade) => grade >= 50;

//FUNCTIONAL TYPES
void greet(String name, {String greeting = "Hello"}) =>
    print("$greeting $name?");

void Function(String, {String greeting}) g = greet;

//LEXICAL CLOSURE
//This refers to a method that a variable within a scope while the method itself sits outside the scope
Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

//TEAR OFFS
//When the called function takes up by a function taking up the same parameters as the calling functions, encouraged not to put them in a lambda

//GENERATORS
// Synchronous generator, returns multiple values on demand. It doesn't execute unitl when first called
Iterable<int> squaresTo(int n) sync* {
  int m = 0;
  while (m < n) {
    yield m * m;
    m++;
  }
}
