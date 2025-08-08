import 'node.dart';

void runLinkedList() {
  final node1 = Node(value: 1);
  final node2 = Node(value: 2);
  final node3 = Node(value: 3);

  node1.next = node2;
  node2.next = node3;

  print(node1);

  final linkedList = LinkedList<int>();
  linkedList.push(5);
  linkedList.push(10);
  linkedList.push(15);
  linkedList.push(20);
  print(linkedList);

  linkedList.append(4);
  linkedList.append(3);
  linkedList.append(2);
  linkedList.append(1);
  linkedList.append(0);
  print(linkedList);
}

// A linked list holds a value and has a reference to next value or null; indicating that the list has come to the last element
// Efficient than a dart list as it allows efficient addition & removal from the front of the list
//The linked list is a recurssive list, the to string method allows it to reprint itself untill null is reached
