//GENERICS
//Generics is a method of specifying the type of values inside a collection
//Uses angle brackets (<>)
//generics help to deal with code duplication issue
//generecs are also used to create trees
//one can make generic classes and functions

//example; Binary tree
//without generics

// class IntNode {
//   int value;
//   IntNode(this.value);

//   IntNode? leftChild;
//   IntNode? rightChild;
// }

// IntNode createIntTree() {
//   final zero = IntNode(0);
//   final one = IntNode(1);
//   final five = IntNode(5);
//   final seven = IntNode(7);
//   final eight = IntNode(8);
//   final nine = IntNode(9);

//   seven.leftChild = one;
//   seven.rightChild = nine;
//   one.leftChild = zero;
//   one.rightChild = five;
//   nine.leftChild = eight;

//   return seven;
// }

// class StringNode {
//   String value;
//   StringNode(this.value);

//   StringNode? leftChild;
//   StringNode? rightChild;
// }

// StringNode createStringTree() {
//   final zero = StringNode('zero');
//   final one = StringNode('one');
//   final five = StringNode('five');
//   final seven = StringNode('seven');
//   final eight = StringNode('eight');
//   final nine = StringNode('nine');

//   seven.leftChild = one;
//   seven.rightChild = nine;
//   one.leftChild = zero;
//   one.rightChild = five;
//   nine.leftChild = eight;

//   return seven;
// }

//note; there's duplication of code above, and if one wanted to create a tree
//of booleans, then that would require another class & method. hence need of
//introducing generics as shown below

class Node<T> {
  T value;
  Node(this.value);

  Node<T>? leftChild;
  Node<T>? rightChild;
}

//note: there's also duplication of code in the functions above
//We will use a heap; where a list stores data to be used to make a tree
//heaps are covered in Data structure & algorithms
Node<E>? createTree<E>(List<E> nodes, [int index = 0]) {
  if (index >= nodes.length) return null;

  final node = Node(nodes[index]);

  final leftNodeIndex = 2 * index + 1;
  final rightNodeIndex = 2 * index + 2;

//below is the case of a recurssive function; a function that calls itself.
//the 1st line helps prevent the function from continuing forever
  node.leftChild = createTree(nodes, leftNodeIndex);
  node.rightChild = createTree(nodes, rightNodeIndex);

  return node;
}

//another example
//generics method
void generics() {
  final student1 = Student('Rhon', 'Phiri');
  final student2 = Student('Uwemi', 'Mwalungira');
  final student3 = Student('David', 'Nzobarinda');
  final student4 = Student('Rafik', 'Maluwa');

  //collection of students
  final students = Collection<Student>('Students', [
    student1,
    student2,
    student3,
    student4,
  ]);
  final random = students.random();
  print(random);
  //collectiion of IDs for a lottery
  final ids = Collection<int>('Lottery IDs',
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]);
  final randomId = ids.random();
  print(randomId);
}

class Person {
  String firstname;
  String surname;

  Person(this.firstname, this.surname);

  String get fullname => '$firstname $surname';

  @override
  String toString() => fullname;
}

class Student extends Person {
  Student(super.firstname, super.surname);
}

class Collection<T> {
  String collectionName;
  List<T> data;

  Collection(this.collectionName, this.data);

  T random() {
    data.shuffle();
    return data[0];
  }
}

void main() {
  // final tree = createTree([7, 1, 9, 0, 5, 8]);
  final tree = createTree([
    'seven',
    'one',
    'nine',
    'zero',
    'five',
    'eight',
  ]);
  print(tree?.value);
  print(tree?.leftChild?.value);
  print(tree?.rightChild?.value);
  print(tree?.leftChild?.leftChild?.value);
  print(tree?.leftChild?.rightChild?.value);
  print(tree?.rightChild?.leftChild?.value);
  print(tree?.rightChild?.rightChild?.value);
}
