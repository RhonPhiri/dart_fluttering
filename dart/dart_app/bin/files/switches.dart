// switch statement chaecks the value assigned, and executes a block of code if the
//case satifies the value.
//If not, the next case is checked. Also a default is provided or nothing is executed
//if the condition is not met
// void main() {
//   int value = 6;
//   switch (value) {
//     case 0:
//       print('Zero');
//     case 1:
//       print('One');
//     case 2:
//       print('Two');
//     case 3:
//       print('Three');
//   }
// }

//Switch expression don't use case and default.
//always retains a value and guarantees complete exhaustion of the cases
//commonly used for assignment
void main() {
  int value = 2;
  final result = switch (value) {
    0 => 'Zero',
    1 => 'One',
    2 => 'Two',
    3 => 'Three',
    _ => 'Value not in range 0-3'
  };
  print(result);
}
