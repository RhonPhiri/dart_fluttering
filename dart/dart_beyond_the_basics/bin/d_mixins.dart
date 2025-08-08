//mixins
//they allow a class to extend more than one class, instead of using inheritance

// Challenge 1: Calculator
// 1 Create a class called Calculator with a method called sum that prints the sum of any two integers you give it.
// 2 Extract the logic in sum to a mixin called Adder .
// 3 Use the mixin in Calculator .
mixin Adder {
  int sum(int a, int b) {
    return a + b;
  }
}

//use the with keyword
class Calculator with Adder {}

void main() {
  final myCalculator = Calculator();
  final sum = myCalculator.sum(10, 20);
  print(sum);
}
