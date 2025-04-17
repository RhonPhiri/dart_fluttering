class Person {
  String givenname;
  String surname;
  Person(this.givenname, this.surname);

  String get fullname => '$givenname $surname';

  @override
  String toString() => fullname;
}

//Inheritance important to avoid redundancy
enum Grades { A, B, C, D, E, F }

class Student extends Person {
  Student(super.givenname, super.surname);
  //if initializer list is used, the super keyword muat be the last one.

  var grades = <Grades>[];
  //use the @override keyword to make changes to code in the parent code
  @override
  String get fullname => '$surname $givenname';
}

class SchoolBandMember extends Student {
  SchoolBandMember(super.givenname, super.surname);

  static const numberOfPractices = 2;
}

class SchoolAthlete extends Student {
  SchoolAthlete(super.givenname, super.surname);

  bool get isEligible => grades.every((grade) => grade != Grades.F);
}

void main() {
  final rhon = Student('Rhon', 'Phiri');
  print(rhon);
  final chimango = Person('Chimango', 'Phiri');
  print(chimango);
  final matthews = SchoolBandMember('Matthews', 'Chirwa');
  print(matthews);
  final jane = SchoolAthlete('Jane', 'Shawa');
  print(jane);

  // ignore: unused_local_variable
  final students = [rhon, matthews, jane];
  //note: the type for students is "Student"

  //Inheritance not so good
  //Prefer adding the function to the individual classes rather than inheritance
  //Else, use abstract classes if you will inherit everything
  //Use mixins if you only need some of the behaviour of the parent class

//challenge 1
  final watermelon = WaterMelon(color: 'Green');
  watermelon.describeColor();

//challenge 2
  final nohr = Intellectual('nohr', 'irihp');
  nohr.roles.add(Roles.athlete);
  print(nohr);
  print(nohr.roles);
}

//challenge1
class Fruit {
  String color;
  Fruit({required this.color});

  void describeColor() {
    print('The color of this fruit is $color');
  }
}

class Melon extends Fruit {
  Melon({required super.color});
}

class WaterMelon extends Melon {
  WaterMelon({required super.color});

  @override
  void describeColor() {
    print('The color of this fruit is $color with darker $color stripes!');
  }
}

class Cantaloupe extends Melon {
  Cantaloupe({required super.color});
}

//Challenge 2

enum Roles { athlete, bandMember, studentUnionMember }

class Individual {
  String givenName;
  String surName;

  Individual(this.givenName, this.surName);

  String get fullName => '$givenName $surName';

  @override
  String toString() => fullName;
}

class Intellectual extends Individual {
  Intellectual(super.givenName, super.surName);

  List<Roles> roles = [];
}
