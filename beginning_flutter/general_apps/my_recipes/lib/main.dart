import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:logging/logging.dart' as system_log;
import 'package:my_recipes/ui/main_screen.dart';
import 'package:my_recipes/ui/theme/theme.dart';
import 'package:my_recipes/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mock_service/mock_service.dart';
import 'providers.dart';

Future<void> main() async {
  _setupLogging(); //used to print the log files to the console
  WidgetsFlutterBinding
      .ensureInitialized(); //ensure proper initialization of flutter framework
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  if (isDesktop()) {
    await DesktopWindow.setWindowSize(const Size(600, 600));
    await DesktopWindow.setMinWindowSize(const Size(260, 600));
  }

  final sharedPrefs = await SharedPreferences.getInstance();
  final service = await MockService.create();

  runApp(ProviderScope(overrides: [
    sharedPrefProvider.overrideWithValue(sharedPrefs),
    serviceProvider.overrideWithValue(service),
  ], child: MyApp()));
}

void _setupLogging() {
  putLumberdashToWork(withClients: [
    ColorizeLumberdash(),
  ]);
  system_log.Logger.root.level = system_log.Level.ALL;
  system_log.Logger.root.onRecord.listen((rec) {
    debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode currentTheme = ThemeMode.light;
  @override
  Widget build(BuildContext context) {
    return PlatformMenuBar(
      menus: [
        PlatformMenuItem(
          label: 'Dark Mode',
          onSelected: () {
            setState(() {
              currentTheme = ThemeMode.dark;
            });
          },
        ),
        PlatformMenuItem(
          label: 'Light Mode',
          onSelected: () {
            setState(() {
              currentTheme = ThemeMode.light;
            });
          },
        ),
        PlatformMenuItem(
          label: 'Quit',
          onSelected: () {
            setState(() {
              SystemNavigator.pop();
            });
          },
          shortcut: SingleActivator(LogicalKeyboardKey.keyQ, meta: true),
        ),
      ],
      child: MaterialApp(
          title: 'My Recipes',
          debugShowCheckedModeBanner: false,
          themeMode: currentTheme,
          theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
          darkTheme:
              ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
          home: MainScreen()),
    );
  }
}
