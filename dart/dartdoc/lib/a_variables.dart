//V A R I A B L E S
//variables are objects that hold an instance of a class
var name = "Rhon";

//If object of different types then use Object or dynamic (when type is not sure)
//Also specifying the return or variable type is important

//N U L L A B I L I T Y
//Variables can be assigned null if they are nullable, have "?".They need to be initialised
//before they are used
String? nullableName;

//L A T E  V A R I A B L E S
//The late keyword tells dart that;
//1. A non nullable variable will be initialized later
//2. Initialize only when needed (Lazy initializing)
//3. Used when dart analysis fails to detect that a non null variable has been initialized before use
late String greeting; //1 & 3

late double calculator = 123456789 * 123456789; //2

//C O N S T  &  F I N A L
//Used if a variable won't change
//Consts are compile time constants. "static const" is used for class level constants.
//Also used when wanting to access the instance member
class Variable {
  static final String varName = "Rhon";
  String varFullName = varName;
}

//W I L D  C A R D S
//Are used to ignore variables
void variables() {
  ///Varible declared before initialization but dart detects that it's initialized before use
  int id; //3
  //
  print("Name: $name");
  //
  assert(
    nullableName == null,
  ); //This method throws an error if false. It's ignored in production code
  //
  greeting = "Hallo Rhon";
  id = 42;
  print(greeting + id.toString());
  print(calculator.toString());
}
