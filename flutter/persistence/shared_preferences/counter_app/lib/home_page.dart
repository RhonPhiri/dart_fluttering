import 'package:counter_app/models/counter.dart';
import 'package:counter_app/models/counter_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLightMode = context.read<CounterTheme>().isLightMode;
    final counter = context.watch<Counter>();
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text('Counter App'),
        actions: [
          IconButton(
            tooltip: 'Change theme',
            onPressed: () {
              context.read<CounterTheme>().changeTheme();
            },
            icon: Icon(isLightMode ? Icons.wb_sunny : Icons.dark_mode),
          ),
          IconButton(
            tooltip: 'Clear count',
            onPressed: () => counter.clearCountValue(),
            icon: Icon(Icons.highlight_remove),
          ),
        ],
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'The counter value is: ',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            children: [
              TextSpan(
                text: '${counter.count}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment count',
        onPressed: () {
          context.read<Counter>().incrementCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
