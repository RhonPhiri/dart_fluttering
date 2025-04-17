import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_app/models/counter.dart';
import 'home_page.dart';

void main() {
  runApp(ChangeNotifierProvider<Counter>(
      create: (context) => Counter(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
