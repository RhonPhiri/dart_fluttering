import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart' as system_log;
import 'package:lumberdash/lumberdash.dart';
import 'package:recipe_app/ui/core/theme/theme.dart';
import 'package:recipe_app/ui/main_screen.dart';

void main() {
  _setUpLogging();
  runApp(const MyApp());
}

///Lumberdash collects and displays logs
///Colorize_lumberdash displays the logs in color, seperating errors from others
///Logging as System_log sets the content of a log
void _setUpLogging() {
  putLumberdashToWork(withClients: [ColorizeLumberdash()]);
  system_log.Logger.root.level = system_log.Level.ALL;
  system_log.Logger.root.onRecord.listen((rec) {
    debugPrint("${rec.level.name}: ${rec.time}: ${rec.message}");
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode currentThemeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Recipes",
      themeMode: currentThemeMode,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: MainScreen(),
    );
  }
}
