class Node<T> {
  T value;
  Node<T>? next;

  Node({required this.value, this.next});

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;

  //method to add to the linked list. Pushing adds to the beginning (head) of the list
  void push(E value) {
    //THe new head will have the assigned value and the old head will be the next value in the list
    head = Node(value: value, next: head);
    //if the list is empty, then assign the first head as the tail too
    tail ??= head;
  }

  //method to add to the end side of the list
  void append(E value) {
    //if the list is empty, then push the new value
    if (isEmpty) {
      push(value);
      return;
    }

    //add the reference to the next node, & that node will have a null reference
    tail!.next = Node(value: value);

    //the reference is also the tail
    tail = tail!.next;
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty List';
    return head.toString();
  }
}
