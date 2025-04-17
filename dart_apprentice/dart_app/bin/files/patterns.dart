void main() {
//Patterns in dart
//Patterns as explicit as the term itself,
//I think describes how fields appear, how they are arranged
//patterns are like a blueprint, a structural representation of actual data
//they compare against actual values to determine if they match
//When they match, they can pull data out (Destructuring).
//WHERE PATTERNS CAN BE RECOGNISED
//A. VARIABLE DECLARATION
  final (myName, [a, b]) = ('Rhon', [102, 50]);
  //Remember: Records without named fields with equal shape are equal
  print(myName);
  //therefore, I think patterns work best with the data type, Records
//Example above also represents variable assingment

//instead of the syntax below
  var info = userInfo(json);
  var userName = info.name;
  var userAge = info.age;
  print('I am $userName. I am $userAge years old!');
  //one can use patterns
  final (:name, :age) = userInfo(json2);
  print('I am $name. I am $age years old!');
}

const json = {
  'name': 'Rhon Phiri',
  'age': 21,
  'color': 'blue',
};
const json2 = {
  'name': 'Chimango Phiri',
  'age': 23,
  'color': 'blue',
};

({String name, int age}) userInfo(Map<String, dynamic> json) {
  return (name: json['name'] as String, age: json['age'] as int);
}
