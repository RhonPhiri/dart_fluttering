import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/ui/core/theme/colors.dart';
import 'package:recipe_app/ui/groceries/grocery_list.dart';
import 'package:recipe_app/ui/recipes/recipe_list.dart';
import 'package:recipe_app/utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> pageList = [];
  // TODO Add Index Key

  @override
  void initState() {
    super.initState();
    pageList.add(RecipeList());
    pageList.add(GroceryList());
    getCurrentIndex();
  }

  void saveCurrentIndex() async {
    // TODO Save Current Index
  }

  void getCurrentIndex() async {
    // TODO Get Current Index
  }

  //Mathod to change the item tapped on navigation
  void _itemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isDesktop() || isWeb()) {
      return largeLayout();
    } else {
      return mobileLayout();
    }
  }

  Widget largeLayout() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final selectedColor = isDarkMode
        ? darkBackgroundColor
        : cardBackgroundColor;
    return AdaptiveLayout(
      primaryNavigation: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig?>{
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: Key("PrimaryNavigation"),
            builder: (context) {
              return Container(
                decoration: BoxDecoration(color: selectedColor),
                child: AdaptiveScaffold.standardNavigationRail(
                  destinations: getRailNavigations(),
                  onDestinationSelected: _itemTapped,
                  labelType: NavigationRailLabelType.all,
                  selectedIndex: _selectedIndex,
                  backgroundColor: selectedColor,
                  selectedIconTheme: IconTheme.of(
                    context,
                  ).copyWith(color: iconBackgroundColor),
                  unselectedIconTheme: IconTheme.of(
                    context,
                  ).copyWith(color: Colors.black),
                ),
              );
            },
          ),
        },
      ),
      body: SlotLayout(
        config: {
          Breakpoints.standard: SlotLayout.from(
            key: Key("body"),
            builder: (context) => Container(
              color: Colors.white,
              child: IndexedStack(index: _selectedIndex, children: pageList),
            ),
          ),
        },
      ),
      bottomNavigation: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig?>{
          Breakpoints.small: SlotLayout.from(
            key: Key("bottomNavigation"),
            builder: (context) => createBottomNavigationBar(),
          ),
        },
      ),
    );
  }

  List<NavigationRailDestination> getRailNavigations() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final selectedColor = isDarkMode ? Colors.white : Colors.black;

    return [
      NavigationRailDestination(
        icon: SvgPicture.asset(
          "assets/images/icon_recipe.svg",
          colorFilter: ColorFilter.mode(
            _selectedIndex == 0 ? selectedColor : Colors.black,
            BlendMode.srcIn,
          ),
        ),
        label: Text("Recipes", style: TextStyle(fontSize: 10)),
      ),
      NavigationRailDestination(
        icon: SvgPicture.asset(
          "assets/images/shopping_cart.svg",
          colorFilter: ColorFilter.mode(
            _selectedIndex == 1 ? selectedColor : Colors.black,
            BlendMode.srcIn,
          ),
        ),
        label: Text("Groceries", style: TextStyle(fontSize: 10)),
      ),
    ];
  }

  Widget mobileLayout() {
    return Scaffold(
      bottomNavigationBar: createBottomNavigationBar(),
      body: SafeArea(
        child: IndexedStack(index: _selectedIndex, children: pageList),
      ),
    );
  }

  BottomNavigationBar createBottomNavigationBar() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode
        ? darkBackgroundColor
        : smallCardBackgroundColor;
    final selectedColor = isDarkMode ? Colors.white : Colors.black;
    final unselectedColor = isDarkMode ? Colors.white : Colors.grey;

    return BottomNavigationBar(
      backgroundColor: backgroundColor,
      selectedItemColor: selectedColor,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/images/icon_recipe.svg",
            colorFilter: ColorFilter.mode(
              _selectedIndex == 0 ? selectedColor : unselectedColor,
              BlendMode.srcIn,
            ),
            semanticsLabel: "Groceries",
          ),
          label: "Recipes",
        ),
        BottomNavigationBarItem(
          backgroundColor: _selectedIndex == 1
              ? iconBackgroundColor
              : Colors.black,
          icon: SvgPicture.asset(
            "assets/images/shopping_cart.svg",
            colorFilter: ColorFilter.mode(
              _selectedIndex == 1 ? selectedColor : unselectedColor,
              BlendMode.srcIn,
            ),
            semanticsLabel: "Groceries",
          ),
          label: "Groceries",
        ),
      ],
      onTap: _itemTapped,
    );
  }
}
