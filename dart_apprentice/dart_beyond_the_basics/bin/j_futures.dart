//Future is a type which when assigned to an object, puts that object and the
//code associated into the event queue
void main() {
  //observingFutures();
  myFutureMethod();
}

void observingFutures() {
  //NOTE: myFuture has a Future return type.
  //after completion of Future, printing myFuture doesn't work
  //hence one can use callbacks or async/await to access the value

//using callbacks. This is the future implementation
//note the methods will run without waiting for the instance to be called
  Future<int>.delayed(
    Duration(seconds: 5),
    () => 42,
  )
      .then(
        (value) => print('Value: $value'),
      )
      .catchError(
        (error) => print('Error: $error'),
      )
      .whenComplete(
        () => print('Program complete!'),
      );
}

//using async/await is better and more neat
//if a function contains await somewhere in the code, return Future
Future<void> myFutureMethod() async {
  //the rest of the function won't run after dart sees the await keyword
  //It'll wait for the await function to complete
  //the await keyword allows one to access the value of the future
  //to catch errors, wrap the await function in the try-catch block
  try {
    final value = await Future.delayed(
      Duration(seconds: 5),
      () => 100,
    );
    print('Value: $value');
  } catch (error) {
    print(error);
  } finally {
    print('The Future is complete!');
  }
}
