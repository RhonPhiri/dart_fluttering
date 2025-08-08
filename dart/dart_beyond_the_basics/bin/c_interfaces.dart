//INTERFACES
//Important! Keep logic code from the infrastructure code e.g. the UI, which
//changes frequently
//Interface is a description of how communication will happen between 2 parties
//AKA PROTOCOL; Internet Protocol (IP), Hypertext Transfer Protocol (HTTP)
//Interfaces allow communication between 2 parts of code in a program.
//This enables the different code bases to be independent of each other &
//one can be replaced without affecting the other
//Examples of interfaces => Application Programming Interface
//CODE AGAINST INTERFACES NOT IMPLEMENTATION
//Use classes as interfaces. Mostly, Abstract classes are used.
//Repository => Defines an interface that hide the details of how data is stored
//& retrieved

//example
//an interface that obtains the temperature of a city

abstract class DataRepository {
  //below is a factory constructor returning the subclass
  factory DataRepository() => FakeWebServer();
  double? fetchTemperature(String city);
}

//when creating concrete classes to implement the interface, use Implement & not
//extend
class FakeWebServer implements DataRepository {
  @override
  double? fetchTemperature(String city) {
    return 42.0;
  }
}

//you can't do the following
//a. Initialize an object with the interface; it's an abstract class
//b. Directly use the fake webServer, breaks the whole reason behind interfaces

//use factory constructors as they
//a. returns existing instances (constructors) of a class
//b. returns a subclass

//Differences betwween extend & implement
//a. extend only allow extension of one superclass while implements allows
//implementation from multiple superclasses
//b. Extend uses all the logic in the superclass while implementation requires
//you provide the logic details

void main() {
  final repository = DataRepository();
  final temperature = repository.fetchTemperature('Lilongwe');
  print(temperature);

  challengeOne();
  challengeTwo();
}

//Challenges
// Challenge 1: Fizzy Bottles
// 1 Create an interface called Bottle and add a method to it called open .
// 2 Create a concrete class called SodaBottle that implements Bottle and prints “Fizz fizz” when open is called
// 3 Add a factory constructor to Bottle that returns a SodaBottle instance.
// 4 Instantiate SodaBottle by using the Bottle factory constructor and call open on the object

void challengeOne() {
  final sodaBottle = Bottle();
  sodaBottle.open();
}

abstract class Bottle {
  factory Bottle() => SodaBottle();
  void open();
}

class SodaBottle implements Bottle {
  @override
  void open() {
    print('Fizzy Fizzy');
  }
}

// Challenge 2: Fake Notes
// Design an interface to sit between the business logic of your note-taking app and a SQL
// database. After that, implement a fake database class that will return mock data

final notes = 'General anaesthesia execute their effect on the CNS. \nGrouped'
    ' into 2, IV/ Inhaled. \nMost of the IV anaesthetics are inducers while the '
    'inhaled anaesthetics are maintainers';

abstract class MyInterface {
  factory MyInterface() => Database();
  void myNotes();
}

class Database implements MyInterface {
  @override
  void myNotes() {
    print(notes);
  }
}

void challengeTwo() {
  final myInterface = MyInterface();
  myInterface.myNotes();
}
