//Use the on Key word to specify the exception or error object that needs to be handled
//Use the catch() method to get the exception/ error object and use it

//Rethrow Keyword
//Use the rethrow keyword to pass the exception to the callers

// void handleMe() {
//   try {
//     dynamic foo = true;
//     print(foo++);
//   } catch (e) {
//     print("handleMe() partially handled ${e.runtimeType}");
//     rethrow;
//   }
// }

// void handleException() {
//   try {
//     handleMe();
//   } catch (e) {
//     print("Main function finished handling ${e.runtimeType}");
//   }
// }
