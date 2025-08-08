//A stream represents multiple values that will arrive in the future
//streams are type stream
//dart.io contains the File class used to read files

//firstly, reading as a future
import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() {
  // futureMethod();
  // streamMethod();
  // streamTransformation();
  // streamExercise();
  // synchronousGenerator();
  // asynchronousGenerator();
  streamController();
}

Future<void> futureMethod() async {
  final file = File('assets/text.txt');
  final contents = await file.readAsString();
  print(contents);
}

Future<void> streamMethod() async {
  final file = File('assets/text_long.txt');
  final stream = file.openRead();
  // below, one can use a callback, .listen() or await as in futures
  //cancel a stream when nol longer nedded to prevent memory leaks
  StreamSubscription<List<int>>? subscription;
  subscription = stream.listen(
    (data) {
      print(data.length);
      subscription?.cancel();
    },
    cancelOnError: true,
    onDone: () => print('All Done!'),
  );
  // //catch errors using callbacks or try-catch block

  // try {
  //   await for (var data in stream) {
  //     print(data.length);
  //   }
  // } on Exception catch (error) {
  //   print(error);
  // } finally {
  //   print('All done!');
  // }
}

//transforming a stream of bytes into data
Future<void> streamTransformation() async {
  final file = File('assets/text.txt');
  final byteStream = file.openRead();
  final StringStream = byteStream.transform(
    utf8.decoder,
  );
  await for (var data in StringStream) {
    print(data);
  }
}

Future<void> streamExercise() async {
  final myStream = Stream.periodic(
    Duration(seconds: 1),
    (value) => value,
  ).take(10);
  await for (var data in myStream) {
    print(data);
  }
}

//creating streams
//1. from constructors
//2. from asynchronous generators
//first example=> synchronous generator, values are available on demend
Iterable<int> hundredSquares() sync* {
  for (var i = 0; i < 100; i++) {
    yield i * i;
  }
}

void synchronousGenerator() {
  print(hundredSquares());
}

//second: showing the asynchronous generator
//remember, futures use async while streams use async*
Stream<String> consciousness() async* {
  final data = ['Con', 'scious', 'ness'];
  for (var part in data) {
    await Future.delayed(
      Duration(seconds: 1),
    );
    yield part;
  }
}

void asynchronousGenerator() {
  final stream = consciousness();
  stream.listen(
    (data) {
      print(data);
    },
  );
}

//3 using a controller
void streamController() {
  final controller = StreamController<String>();
  final stream = controller.stream;
  final sink = controller.sink;

  sink.add('grape');
  sink.add('grape');
  sink.add('grape');
  sink.add('grape');
  sink.addError(
    Exception('Cherry'),
  );
  sink.add('grape');
  stream.listen(
    (value) {
      print(value);
    },
    onError: (error) => print(error),
    onDone: () => print('done!'),
  );
}
