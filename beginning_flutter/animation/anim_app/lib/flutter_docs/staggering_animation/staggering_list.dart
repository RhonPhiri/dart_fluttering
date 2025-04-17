import 'package:flutter/material.dart';

class StaggeringListHome extends StatelessWidget {
  const StaggeringListHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('F L U T T E R  S T A G G E R'),
        centerTitle: true,
        elevation: 4,
      ),
      endDrawer: Drawer(
        child: Menu(),
      ),
      body: Center(
        child: Text(
          'Open the drawer',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static const _menuItems = [
    'Action',
    'Adventure',
    'Animation',
    'Biography',
    'Documentary',
    'Fiction',
  ];
//each item will initially delay with 50 ms
  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 250);
  //depending on the level along the list, the Items will stagger at different multiples of 50
  static const _staggerTime = Duration(milliseconds: 50);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
//the animation time is not dependdent on the total time it will take to slide, but the stagger time
  final _animationDuration = _initialDelayTime +
      (_staggerTime * _menuItems.length) +
      _buttonDelayTime +
      _buttonTime;
//each item has its own intervaldepending on its index along the list
  final List<Interval> _itemSlideIntervals = [];
  late Interval _buttonInterval;

  void _createAnimationIntervals() {
    for (var i = 0; i < _menuItems.length; i++) {
      final startTime = _initialDelayTime + _staggerTime * i;
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }
    final buttonStartTime = _staggerTime * _menuItems.length + _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
      buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
      buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds,
    );
  }

  @override
  void initState() {
    super.initState();
    _createAnimationIntervals();
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildFlutterLogo(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildFlutterLogo() {
    return Center(
      child: SizedBox(
        width: 500,
        height: 500,
        child: Opacity(
          opacity: 0.5,
          child: FlutterLogo(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        ..._buildMenuList(),
        Spacer(),
        _buildStartedButton(),
      ],
    );
  }

  List<Widget> _buildMenuList() {
    final listItems = <Widget>[];
    for (var i = 0; i < _menuItems.length; i++) {
      listItems.add(
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final animationPercentage = Curves.easeOut.transform(
              _itemSlideIntervals[i].transform(
                _controller.value,
              ),
            );
            final opacity = animationPercentage;
            final slideDistance = (1.0 - animationPercentage) * 150;
            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(slideDistance, 0.0),
                child: child,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 24,
            ),
            child: Text(
              _menuItems[i],
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    }
    return listItems;
  }

  Widget _buildStartedButton() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final animationPercentage = Curves.elasticInOut.transform(
          _buttonInterval.transform(
            _controller.value,
          ),
        );
        final scale = (animationPercentage * 0.5) + 0.5;
        return Opacity(
          opacity: animationPercentage.clamp(0.0, 1.0),
          child: Transform.scale(
            scale: scale,
            child: child,
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 64.0,
            horizontal: 48,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
