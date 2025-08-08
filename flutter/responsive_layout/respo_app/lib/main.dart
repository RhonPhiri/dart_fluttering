import 'package:flutter/material.dart';
import 'package:respo_app/data/models/user.dart';
import 'package:respo_app/data/repositories/user_repo.dart';
import 'package:respo_app/widgets/Navigation/nav_bar.dart';
import 'package:respo_app/widgets/Navigation/nav_rail.dart';
import 'package:respo_app/widgets/animation/animations.dart';
import 'widgets/email_list_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Feed(currentUser: user_0),
    );
  }
}

class Feed extends StatefulWidget {
  const Feed({super.key, required this.currentUser});

  final User currentUser;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with SingleTickerProviderStateMixin {
  late final _colorScheme = Theme.of(context).colorScheme;
  late final _backgroundColor = Color.alphaBlend(
    _colorScheme.primary.withAlpha(36),
    _colorScheme.surface,
  );

  late final _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 1000),
    reverseDuration: Duration(milliseconds: 1250),
  );

  late final _barAnimation = BarAnimation(parent: _controller);

  bool controllerInitialized = false;

  int selectedIndex = 0;

  int navIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final double width = MediaQuery.sizeOf(context).width;

    final AnimationStatus status = _controller.status;

    if (width > 600) {
      if (status != AnimationStatus.forward &&
          status != AnimationStatus.completed) {
        _controller.forward();
      }
    } else {
      if (status != AnimationStatus.reverse &&
          status != AnimationStatus.dismissed) {
        _controller.reverse();
      }
    }
    if (!controllerInitialized) {
      controllerInitialized = true;
      _controller.value = width > 600 ? 1 : 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Scaffold(
          body: Row(
            children: [
              NavRail(
                backgroundColor: _backgroundColor,
                navIndex: navIndex,
                onDestinationSelected: (value) => setState(() {
                  navIndex = value;
                }),
              ),
              Expanded(
                child: Container(
                  color: _backgroundColor,
                  child: EmailListView(
                    selectedIndex: selectedIndex,
                    onSelected: (value) => setState(() {
                      selectedIndex = value;
                    }),

                    currentUser: widget.currentUser,
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            key: ValueKey("inboxFAB"),
            backgroundColor: _colorScheme.tertiaryContainer,
            foregroundColor: _colorScheme.onTertiaryContainer,
            onPressed: () {},
            child: const Icon(Icons.add),
          ),

          bottomNavigationBar: NavBar(
            barAnimation: _barAnimation,
            navIndex: navIndex,
            onDestinationSelected: (value) => setState(() {
              navIndex = value;
            }),
          ),
        );
      },
    );
  }
}
