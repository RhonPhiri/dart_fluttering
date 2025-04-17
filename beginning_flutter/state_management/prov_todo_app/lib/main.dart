import 'package:flutter/material.dart';
import 'package:prov_todo_app/models/todo_list.dart';
import 'package:prov_todo_app/models/todo_theme.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoList(),
        ),
        ChangeNotifierProvider(
          create: (context) => TodoTheme(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<TodoTheme>().isDark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? TodoTheme.darkTodoTheme() : TodoTheme.lightTodoTheme(),
      home: HomePage(),
    );
  }
}
