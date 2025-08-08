import 'package:flutter/material.dart';
import 'package:prov_shop_app/models/app_theme.dart';
import 'package:prov_shop_app/models/cart_item_list.dart';
import 'package:prov_shop_app/models/product_list.dart';
import '../pages/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ProductList()),
    ChangeNotifierProvider(create: (context) => CartItemList()),
    ChangeNotifierProvider(
      create: (context) => AppTheme(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isBright = context.watch<AppTheme>().isBright;
    return MaterialApp(
      themeMode: isBright ? ThemeMode.light : ThemeMode.dark,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
