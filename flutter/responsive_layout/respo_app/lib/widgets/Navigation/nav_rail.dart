import 'package:flutter/material.dart';

import '../../data/repositories/destinations.dart';

class NavRail extends StatelessWidget {
  const NavRail({
    super.key,
    required this.backgroundColor,
    required this.navIndex,
    this.onDestinationSelected,
  });
  final Color backgroundColor;
  final int navIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return NavigationRail(
      backgroundColor: backgroundColor,
      groupAlignment: -0.85,
      leading: Column(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          SizedBox(height: 8),
          FloatingActionButton(
            key: ValueKey("navRailFAB"),
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            backgroundColor: colorScheme.tertiaryContainer,
            foregroundColor: colorScheme.onTertiaryContainer,

            child: Icon(Icons.add),
          ),
        ],
      ),

      destinations: destinations
          .map<NavigationRailDestination>(
            (d) => NavigationRailDestination(
              icon: Icon(d.icon),
              label: Text(d.label),
            ),
          )
          .toList(),
      selectedIndex: navIndex,
      onDestinationSelected: onDestinationSelected,
    );
  }
}
