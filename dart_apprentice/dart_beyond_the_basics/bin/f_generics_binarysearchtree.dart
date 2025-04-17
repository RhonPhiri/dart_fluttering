//Another application of generics is in Binary search tree
//eases up the search period in a collection
//instead of performing a linear search (using e.g. the 'for loop'), it allows searching based on the
//relation between the parent node & the child.

//A BST, when inserting the values, they must be comparable so as to allow
//deciding if;
//a. less than parent; recurse to the left
//b. greater than parent; recurse to the right
//c. create a new node if found a new leaf
//NOTE: always start at the root and compare with all the values down the tree

//creating the node class for our generic
class Node<T> {
  T value;
  Node(this.value);

  Node<T>? leftNode;
  Node<T>? rightNode;

  @override
  String toString() {
    final left = leftNode?.toString() ?? '';
    final parent = value.toString();
    final right = rightNode?.toString() ?? '';
    return '$left $parent $right';
  }
}

//creating the BST class extending the comparable class so that the values are
// comparable

class BinarySearchTree<E extends Comparable> {
  Node<E>? root; //root is the topmost parent

  //building the insert function that will be used to insert nodes in the tree
  void insert(E value) {
    root = _insertAt(root, value); //this method will compare the root and the
    //value
  }

  Node<E> _insertAt(Node<E>? node, E value) {
    //creating a base case; if the node (which is the root) is null, then
    //create a new node at this place
    if (node == null) {
      return Node(value);
    }

    //if no empty node, the following recursive functions will search the tree
    //and assign a child to a parent using comparedTo method
    //if the root is greater than the value, -1 is returned, assign it to the
    //left node

    if (value.compareTo(node.value) < 0) {
      node.leftNode = _insertAt(node.leftNode, value); //this function will keep
      //on recursing on to the leftside of the root until it finds node == null
    } else {
      node.rightNode = _insertAt(node.rightNode, value);
    }

    return node;
  }

  @override
  String toString() {
    return root.toString();
  }
}

void main() {
  final tree = BinarySearchTree<num>();
  final values = [7, 1, 9, 0, 5, 8];
  for (var value in values) {
    tree.insert(value);
  }

  print(tree);
}
