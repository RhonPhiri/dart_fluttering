import 'package:counter_app/models/counter.dart';
import 'package:counter_app/models/counter_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterTheme()),
        ChangeNotifierProvider(create: (context) => Counter()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isLightMode = context.watch<CounterTheme>().isLightMode;
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: isLightMode ? Brightness.light : Brightness.dark,
        ),
      ),
      home: HomePage(),
    );
  }
}
