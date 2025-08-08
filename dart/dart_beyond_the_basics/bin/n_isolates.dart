import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

void main() {
  // multipleSmsIsolateMain();
  // oneSmsIsolateMain();
  // multipleParameterIsolate();
  // twoWayCommunicationIsolate();
  // challengeOne();
  challengeTwo();
}

//One way, one message isolate
//entry point; the function to be run by the new Isolate
void oneSmsIsolateEntryPoint(SendPort sendPort) {
  var counting = 0;
  for (var i = 1; i <= 1000000000; i++) {
    counting = i;
  }
  final message = '$counting. Ready or not, here I come!';
  Isolate.exit(sendPort, message);
}

Future<void> oneSmsIsolateMain() async {
  final receivePort = ReceivePort();
  Isolate.spawn<SendPort>(
    oneSmsIsolateEntryPoint,
    receivePort.sendPort,
  );
  final message = await receivePort.first as String;
  print(message);
}

//one way, multiple sms isolate
Future<void> multipleSmsIsolateMain() async {
  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn<SendPort>(
    multipleSmsIsolateEntryPoint,
    receivePort.sendPort,
  );
  receivePort.listen((Object? message) {
    if (message is String) {
      print(message);
    } else if (message == null) {
      receivePort.close();
      isolate.kill();
    }
  });
}

Future<void> multipleSmsIsolateEntryPoint(SendPort sendPort) async {
  sendPort.send('Starting the count-down!');
  var counting = 0;
  for (var i = 10; i >= 0; i--) {
    await Future.delayed(
      Duration(seconds: 1),
    );
    counting = i;
    sendPort.send('$counting');
  }
  sendPort.send(null);
}

//oneway isolate, multiple sms with an entry-point that allows multiple
//parameters
Future<void> multipleParameterIsolate() async {
  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn<List<Object>>(
    multipleParameterIsolateEntryPoint,
    [receivePort.sendPort, 0],
  );
  receivePort.listen(
    (Object? message) {
      if (message is String) {
        print(message);
      } else if (message == null) {
        receivePort.close();
        isolate.kill();
      }
    },
  );
}

Future<void> multipleParameterIsolateEntryPoint(List<Object> arguments) async {
  final sendPort = arguments[0] as SendPort;
  final countTo = arguments[1] as int;

  sendPort.send('Starting count-down!');
  var countDown = 0;
  for (var i = 10; i >= countTo; i--) {
    await Future.delayed(
      Duration(seconds: 1),
    );
    countDown = i;
    sendPort.send('$countDown');
  }
  sendPort.send(null);
}

//Two way communication Isolate
//creating a two way communication between the parent isolate Earth & the child
//Isolate mars
class Work {
  Future<int> doSomething() async {
    print('Doint some work...');
    sleep(Duration(seconds: 1));
    return 42;
  }

  Future<int> doSomethingElse() async {
    print('Doing something else...');
    sleep(Duration(seconds: 1));
    return 24;
  }
}

//creating the entry point for the child isolate
Future<void> _entryPoint(SendPort senfToEarthPort) async {
  final receiveOnMarsPort = ReceivePort();
  senfToEarthPort.send(receiveOnMarsPort.sendPort);

  final work = Work();

  receiveOnMarsPort.listen(
    (Object? messagesFromEarth) async {
      await Future.delayed(Duration(seconds: 1));
      print('Message from earth: $messagesFromEarth');
      if (messagesFromEarth == 'Hey from Earth') {
        senfToEarthPort.send('Hey from Mars');
      } else if (messagesFromEarth == 'Can you help?') {
        senfToEarthPort.send('Sure!');
      } else if (messagesFromEarth == 'Do something') {
        final result = await work.doSomething();
        senfToEarthPort.send({
          'method': 'doSomething',
          'result': result,
        });
      } else if (messagesFromEarth == 'Do something else') {
        final result = await work.doSomethingElse();
        senfToEarthPort.send({
          'method': 'doSomethingElse',
          'result': result,
        });
        senfToEarthPort.send('Done');
      }
    },
  );
}

//creating the main Isolate
class Earth {
  final _receiveOnEarthPort = ReceivePort();
  SendPort? _sendToMarsPort;
  Isolate? _marsIsolate;

  Future<void> contactMars() async {
    if (_marsIsolate != null) return;

    _marsIsolate = await Isolate.spawn(
      _entryPoint,
      _receiveOnEarthPort.sendPort,
    );

    _receiveOnEarthPort.listen(
      (Object? messageFromMars) async {
        await Future.delayed(Duration(seconds: 1));
        print('Message from Mars: $messageFromMars');
        if (messageFromMars is SendPort) {
          _sendToMarsPort = messageFromMars;
          _sendToMarsPort?.send('Hey from Earth');
        } else if (messageFromMars == 'Hey from Mars') {
          _sendToMarsPort?.send('Can you help?');
        } else if (messageFromMars == 'Sure!') {
          _sendToMarsPort?.send('Do something');
          _sendToMarsPort?.send('Do something else');
        } else if (messageFromMars is Map) {
          final method = messageFromMars['method'] as String;
          final result = messageFromMars['result'] as int;
          print('The result of $method is $result');
        } else if (messageFromMars == 'Done') {
          print('Shutting down');
          dispose();
        }
      },
    );
  }

  void dispose() {
    _receiveOnEarthPort.close();
    _marsIsolate?.kill();
    _marsIsolate = null;
  }
}

Future<void> twoWayCommunicationIsolate() async {
  final earth = Earth();
  await earth.contactMars();
}

//challenge 1
Future<void> challengeOne() async {
  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn<List<Object>>(
    challengeOneEntryPoint,
    [receivePort.sendPort, 7],
  );
  receivePort.listen(
    (Object? message) {
      if (message is String) {
        print(message);
      } else if (message == null) {
        receivePort.close();
        isolate.kill();
      }
    },
  );
}

void challengeOneEntryPoint(List<Object> arguments) {
  final sendPort = arguments[0] as SendPort;
  final nth = arguments[1] as int;
  sendPort.send('Calculating the $nth value in the fibinacco sequence!');
  int a = 1;
  int b = 1;
  int c = 0;
  for (var i = 3; i <= nth; i++) {
    c = a + b;
    a = b;
    b = c;
  }
  sendPort.send('The $nth th value in the fibinacco sequence is $c');
  sendPort.send(null);
}

//challenge 2
Future<void> challengeTwo() async {
  final jsonString = '''
{
 "language": "Dart",
 "feeling": "love it",
 "level": "intermediate"
}
''';
  final receivePort = ReceivePort();
  await Isolate.spawn(
    challengeTwoEntryPoint,
    [receivePort.sendPort, jsonString],
  );
  final message = await receivePort.first as Map;
  print(message);
}

void challengeTwoEntryPoint(List<Object> arguments) {
  final sendPort = arguments[0] as SendPort;
  final jsonString = arguments[1] as String;

  final Map jsonMap = jsonDecode(jsonString);
  Isolate.exit(
    sendPort,
    jsonMap,
  );
}
