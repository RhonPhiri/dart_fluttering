void loops() {
  lables();
}

// Break & Continue
//Break is used to stop the looping once a condition is met, while continue is used to skip to the next loop when a particular condition is met

//Lables; a lable is an identifier followed by a colon, placed @ the start of for loops & switch statements for later referencing
void lables() {
  // Case 1; Using break
  // outerLoop:
  // for (var i = 1; i < 4; i++) {
  //   for (var j = 1; j < 4; j++) {
  //     print("i = $i, j = $j");
  //     if (i == 2 && j == 2) {
  //       break outerLoop;
  //     }
  //   }
  //   print("Inner loop exited");
  // }
  // print("Outer loop exited");

  // // Case 2; using continue
  // outerLoop:
  // for (var i = 1; i < 4; i++) {
  //   for (var j = 1; j < 4; j++) {
  //     if (i == 2 && j == 2) {
  //       continue outerLoop;
  //     }
  //     print("I = $i, J = $j");
  //   }
  // }

  // Case 3; Using while & do while

  var i = 1;
  outerLoop:
  while (i < 4) {
    var j = 1;
    innerLoop:
    while (j < 4) {
      if (i == 2 && j == 2) {
        break outerLoop;
      }

      print("I = $i, J = $j");
      j++;
    }

    print("Inner loop exit");
    i++;
  }
  print("Outer loop exit");
}
