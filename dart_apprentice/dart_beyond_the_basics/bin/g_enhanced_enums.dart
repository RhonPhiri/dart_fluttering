//Enums
//Enums are employed if one has a const small number of properties  that need to be represented
enum TrafficLight {
  green,
  yellow,
  red,
}

void reviewEnum() {
  final trafficLight = TrafficLight.green;

  switch (trafficLight) {
    case TrafficLight.green:
      print('Go!');
      break;
    case TrafficLight.yellow:
      print('Slow Down!');
      break;
    case TrafficLight.red:
      print('Stop!');
      break;
  }
}

//enums are also classes hence can usethe same logic used in classes
//the properties of the enum are the only instances that will call the constructor
//enum constructor is always const
enum PlayBackStatus {
  playing('Playing'),
  paused('Paused!'),
  stopped('Stopped!');

  final String message;
  const PlayBackStatus(this.message);
}

void enumAsClasses() {
  final playBackState = PlayBackStatus.paused;
  print(playBackState);
}

//Operator Overroading
//Using operators to add the instances of a class that support operator overroading
//example as used with classes
class Point {
  final double x;
  final double y;

  Point({required this.x, required this.y});

  @override
  String toString() => '($x, $y)';

  //operator overrading method below;
  Point operator +(Point other) {
    return Point(x: x + other.x, y: y + other.y);
  }
}

void operatorOverroading() {
  final pointA = Point(x: 1, y: 4);
  print('point A: $pointA');
  final pointB = Point(x: 4, y: 2);
  print('point B: $pointB');
  //I would like to add point A & B instances using operator overroading
  //method in the class
  final pointC = pointA + pointB;
  print('point C: $pointC');
}

//operator overroading as used in enums
//since enums are classes, they too support operator overroading
//example where you add number of days to a day from an enum class to print what day of the week it will be
enum Day {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday; //remember the semicolon for the last enum value

  //operator overriding method, adding a number to the current index and tell the user what day it will be
  Day operator +(int days) {
    final numberOfDays = Day.values.length;
    final index = (this.index + days) % numberOfDays;
    return Day.values[index];
  }
}

void enumOperatorOverride() {
  final today = Day.tuesday;
  print('Today is ${today.name}');
  final anotherDay = today + 10;
  print('The other day will be ${anotherDay.name}');
}

void main() {
  enumAsClasses();
  reviewEnum();
  operatorOverroading();
  enumOperatorOverride();
}
