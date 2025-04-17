//creating a stack class with a generic type
class Stack<E> {
  //field to hold the stack of data
  final List<E> _storage;

  //Initialize the field upon calling the constructor
  //in data structures, lists offer const time insertions & deletions
  Stack() : _storage = <E>[];

  //overriding the toString to show all elements from last to first
  @override
  String toString() {
    return '---Top---\n'
        '${_storage.reversed.join('\n')}'
        '\n---------';
  }

  //method to add an element
  void push(E element) => _storage.add(element);
  //method to remove an element
  E pop() => _storage.removeLast();
  // getter to peek at the last element
  E get peek => _storage.last;
  //getter to check if stack is empty
  bool get isEmpty => _storage.isEmpty;
  //getter to check if stack is not empty
  bool get isNotEmpty => !isEmpty;

  //Named constructor to set an iterable to the private storage property upon calling the constructor,
  //and not iterating each value one after the other
  Stack.of(List<E> elements) : _storage = List.of(elements);

  //function to print in reverse
  //O(n) time complexity (linear time)
  void printInReverse(List<E> list) {
    var stack = Stack<E>();
    for (E element in list) {
      stack.push(element);
    }
    while (stack.isNotEmpty) {
      print(stack.pop());
    }
  }

  //method to check if parentheses of a string are balanced
  bool checkParentheses(String text) {
    final stack = Stack<int>();
    final open = '('.codeUnitAt(0);
    final close = ')'.codeUnitAt(0);
    for (int codeUnit in text.codeUnits) {
      if (codeUnit == open) {
        stack.push(codeUnit);
      } else if (codeUnit == close) {
        if (stack.isEmpty) {
          return false;
        } else {
          stack.pop();
        }
      }
    }
    return stack.isEmpty;
  }
}
