import 'dart:io';

import 'package:counter_app/models/counter_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.storage});
  final CounterStorage storage;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //initial count value
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounterValue().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  //method to increment the count value
  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });

    return widget.storage.writeCounterValue(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 10, title: Text('P A T H  P R O V')),
      body: Center(
        child: Text(
          'You pressed the button $_counter time${_counter == 1 ? '' : 's'}',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment count',
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
