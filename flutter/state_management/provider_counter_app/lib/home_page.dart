import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/counter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<Counter>();
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text('CO U N T E R  A P P'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Counter: ${counter.count}',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: counter.increment,
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: counter.decrement,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
