import 'package:doggie_app/providers/doggie_provider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';

void main() async {
  //ensure proper initialization of flutter before calling asynchronous code
  WidgetsFlutterBinding.ensureInitialized();
  //method to create the database & create the dog table on creation
  //create a path independent of the platform using path, add the name of the database
  final doggieDatabase = openDatabase(
    join(await getDatabasesPath(), 'doggie_database.db'),
    version: 1,
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    },
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => DoggieProvider(database: doggieDatabase),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}
