void collections() {
  // nullAwareCollection();
  shoppingListMan();
}

void nullAwareCollection() {
  //Null aware collections
  int? presentKey = 3;

  String? presentEntry = "Three";
  String? absentEntry;

  var mapA = {presentKey: presentEntry};
  var mapB = {presentKey: absentEntry};
  var mapC = {
    presentEntry: ?absentEntry,
  }; //Note the null operator on the nullable value
  //If the element evaluates to null, the value is not inserted into the collection

  print(mapA);
  print(mapB);
  print(mapC);
}

//Challenge1
//  Shopping List Manager
//     Goal: Keep track of grocery items.
//     Details:
//         Use a List<String> to store item names.
//         Write functions to:
//             Add an item (avoid duplicates).
//             Remove an item by name.
//             Print the full list, numbered.
List<String> cart = [];

void shoppingListMan() {
  addToCart("Fish");
  addToCart("Soya Pieces");
  addToCart("Tommato");
  addToCart("Fish");
  removefromCart("Tomato");
  printCart();
}

void addToCart(String item) {
  cart.addAll([if (!cart.contains(item)) item]);
}

void removefromCart(String item) {
  cart.remove(item);
}

void printCart() {
  print(cart);
}
