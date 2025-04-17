//S T A C K S
//Stack data structure uses the push & pop methods to add & remove the top most data object respectively
//Utilizes the  L I F O  principle (LAST IN FIRST OUT)

import 'stack_class.dart';

void runStack() {
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  stack.push(5);
  print(stack);

  final poppedElement = stack.pop();
  print('Popped: $poppedElement');

  print("Last element: ${stack.peek}");

  print("Stack is empty: ${stack.isEmpty}");

  print("Stack is NOT empty: ${stack.isNotEmpty}");

  final numList = [10, 11, 12, 13, 14, 15];
  final numStack = Stack.of(numList);
  print(numStack);
  numStack.pop();
  print(numStack);

  //challenge1
  Stack<String>().printInReverse(['d', 'r', 'a', 'w', 'e', 'r']);

  //challenge2
  print(Stack<String>().checkParentheses('(text)()'));
}
