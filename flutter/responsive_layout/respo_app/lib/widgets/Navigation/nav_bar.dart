import 'package:flutter/material.dart';
import 'package:respo_app/widgets/animation/animations.dart';
import 'package:respo_app/widgets/animation/transitions.dart';

import '../../data/repositories/destinations.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.navIndex,
    this.onDestinationSelected,
    required this.barAnimation,
  });
  final int navIndex;
  final ValueChanged<int>? onDestinationSelected;
  final BarAnimation barAnimation;

  @override
  Widget build(BuildContext context) {
    return BottomBarTransition(
      animation: barAnimation,
      backgroundColor: Colors.white,
      child: NavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        destinations: destinations
            .map<NavigationDestination>(
              (d) => NavigationDestination(icon: Icon(d.icon), label: d.label),
            )
            .toList(),
        selectedIndex: navIndex,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
