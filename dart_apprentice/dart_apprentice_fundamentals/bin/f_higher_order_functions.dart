// ANONYMOUS FUNCTIONS
// these are nameless functions. Values of type Function. Can be passed
// around like other values
// Anonymous functions can be used as parameters & returned from other functions
// Higher order functions are functions that return/ take functions as their
// parameters

void main() {
  forEachLoop();
  mapFunction();
  filteringFunction();
  collectionConsolidation();
  sorting();
  higherOrderExercise();
}

final numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];

void forEachLoop() {
// for and while loops require an index
// for-in loops iterate the whole collection without needing an index
// ForEach loop, performs an action on each element in the iterable
  numbers.forEach((int number) {
    print(number * 3); //this is an anonymous function as a parameter
  });
  //but recommended not to use functions in forEach loop unless the function
  //has been assigned to a variable as shown below
  final quad = (int x) => print(x * 4);
  numbers.forEach(quad);

  //maps don't implement iterables & do not use the for loop
  //but use the forEach loop
  Map<String, String> studentGrades = {'Rhon': 'A', 'Chimango': 'A+'};
  studentGrades.forEach((student, grade) {
    print('$student: $grade');
  });
}

void mapFunction() {
  ///One would use the for loop to loop all elements from one collection to the
  ///other as below
  List newNumbers = <int>[];
  for (int x in numbers) {
    newNumbers.add(x * x);
  }
  print(newNumbers);

  ///use the map function instead
  final mapped = numbers.map((int x) => x *= 2);

  print(mapped.toList());
}

filteringFunction() {
  ///use the where function to filter out a collection
  final evenNumbers = numbers.where((element) => element.isEven);
  print(evenNumbers.toList());
}

void collectionConsolidation() {
  ///this involves higher order function taking all the values of a collection
  ///and combine them into one value e.g. sum, product etc.
  ///1st higher order function => Reduce()
  final oddNumbers = numbers.where(
    (element) => element.isOdd,
  );
  final summation = oddNumbers.reduce((sum, element) => sum + element);
  print(summation);

  ///2nd higher order function => fold()
  ///with fold, the collection can empty & the app won't crash since you assign
  ///the first element as compared to reduce()
  final subtraction =
      oddNumbers.fold(0, (subtraction, element) => subtraction - element);
  print(subtraction);
}

void sorting() {
  ///use the sort method to sort contents in a collection
  final numbers = [
    'one',
    'three',
    'five',
    'seven',
    'eleven',
    'thirteen',
    'fifteen',
    'seventeen',
    'ninteen',
  ];
  numbers.sort();
  print(numbers);

  ///use an anonymous function inside sort to establish the order of sorting
  ///in the case above, the rule was alphabet. below shows a sorting based on
  ///length

  numbers.sort((no1, no2) => no1.length.compareTo(no2.length));
  print(numbers);
}

void higherOrderExercise() {
  final scores = [89, 77, 46, 93, 82, 67, 32, 88];
  scores.sort();
  final filtered = scores.where((score) => 80 < score && score < 90);
  print(filtered);
}
