import 'package:flutter/material.dart';
import 'package:widgets_app/widgets/flow/flow_menu_delegate.dart';

class FlowHome extends StatefulWidget {
  const FlowHome({super.key});

  @override
  State<FlowHome> createState() => _FlowHomeState();
}

class _FlowHomeState extends State<FlowHome>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _menuOpened = false;

  //variable to store the icon last clicked
  IconData _iconLastClicked = Icons.home;
  //variable to hold a list of Icons contained in the flow widget
  final List<IconData> _menuItems = [
    Icons.home,
    Icons.notifications,
    Icons.settings,
    Icons.info,
    Icons.menu,
  ];

  //method to direct the responses when an icon is tapped
  void _handleIconTapped(IconData icon) {
    //first, reassing the lastClickedicon
    if (icon != Icons.menu) {
      _iconLastClicked = icon;
    }
    //play the animation, forward or reverse
    if (!_animationController.isAnimating) {
      _animationController.status == AnimationStatus.completed
          ? _animationController.reverse()
          : _animationController.forward();
      _menuOpened = !_menuOpened;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('F L O W'), elevation: 4),
      body: Stack(
        children: [
          IndexedStack(
            index: _menuItems.indexOf(_iconLastClicked),
            children:
                _menuItems
                    .map((icon) => Center(child: Icon(icon, size: 80)))
                    .toList(),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              width: 100,
              height: 100.0 * _menuItems.length,
              clipBehavior: Clip.none,
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(border: Border.all()),
              child: Flow(
                delegate: FlowMenuDelegate(animation: _animationController),
                children:
                    _menuItems
                        .map(
                          (icon) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FloatingActionButton(
                              onPressed: () => _handleIconTapped(icon),
                              elevation: 1,
                              shape: CircleBorder(),
                              heroTag: icon.toString(),
                              tooltip: icon.toString(),
                              child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 250),
                                transitionBuilder:
                                    (child, animation) => ScaleTransition(
                                      scale: animation,
                                      child: child,
                                    ),
                                child:
                                    icon == Icons.menu && _menuOpened
                                        ? Icon(
                                          Icons.clear,
                                          key: ValueKey('clear'),
                                        )
                                        : Icon(icon, key: ValueKey(icon)),
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
