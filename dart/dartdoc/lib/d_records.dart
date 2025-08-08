import 'package:dartdoc/exercises/b.%20records.dart';

void recordType() {
  // //Records are a list of comma separated values (named\positional) that are enclosed in parenthesis
  // var record = ("First", a: 2, b: false, "Last");

  // print(record.$1);
  // print(record.a);
  // print(record.b);
  // print(record.$2);

  // //The shape of the record is determined by how the fields have been positioned or named
  // //Records are equal only if they have the same fields and values. A named field is a type on its own
  // (int a, int b, int c) pointA = (1, 2, 3);
  // (int x, int y, int z) pointB = (1, 2, 3);
  // print(pointA == pointB);
  // ({int a, int b, int c}) pointC = (a: 1, b: 2, c: 3);
  // ({int x, int y, int z}) pointD = (x: 1, y: 2, z: 3);
  // print(pointC == pointD);

  // //Records allow functions to return multiple values
  // final Map<String, dynamic> dbase = {"name": "Rhon", "age": 22, "height": 6.9};
  // final user1 = jsonParser(dbase);
  // print(user1.name);
  // print(user1.age);
  // final (:name, :age) = jsonParser(dbase);
  // print(name);
  // print(age);

  // // //Records can be used to hold data instead of creating classes to do the same job. Similar job to enhanced enums
  // final List<Student> students = [
  //   (name: "Rhon Phiri", age: 22, program: "BDS"),
  //   (name: "Vincent Chilemba", age: 21, program: "MBBS"),
  //   (name: "Joe Tembo", age: 22, program: "MBBS"),
  // ];
  // for (var i = 0; i < students.length; i++) {
  //   print("Student name: ${students[i].name}");
  // }

  recordExercises();
}

// one can also use typedef to make it easier to define a record
typedef Student = ({String name, int age, String program});

({String name, int age}) jsonParser(Map<String, dynamic> json) {
  return (name: json["name"] as String, age: json["age"] as int);
}
