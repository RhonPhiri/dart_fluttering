//CONCURRENCY
//This topic aims at equipping with skills important when handling tasks that
//take a long time & might result in the app freezing waiting for the task to
//finish (e.g downloading content, making calculations, etc.)
//concurrency as opposed to parallelism, involves running tasks on a single
//core or processor
//The code can be synchronous (running one line of code & the next in order of
//each other), asynchronous; involves rescheduling tasks to run when the thread
//is not busy
//Dart first runs synchronous tasks by putting them in an event loop, then
//checks the microtask queue, before checking in the event queue for
//asynchronous tasks

void main() {
  observingTheEventLoop();
}

void observingTheEventLoop() {
  //the future class puts the code in the block in the event queue
  print('first');
  //use the then() method of future to run a code block immediately after the
  //future
  Future(
    () => print('second'),
  ).then(
    (value) => print('fourth'),
  );
  Future(
    () => print('fifth'),
  );
  //use the .delayed method to simulate delaying tasks
  Future.delayed(
    Duration(seconds: 5),
    () => print('sixth'),
  );
  print('third');
}
