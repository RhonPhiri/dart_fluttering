import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PhysicsSimulationHomePage extends StatelessWidget {
  const PhysicsSimulationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('P H Y  S I M U L'),
        centerTitle: true,
        elevation: 4,
      ),
      body: DraggableCard(
        child: FlutterLogo(
          size: 128,
        ),
      ),
    );
  }
}

class DraggableCard extends StatefulWidget {
  const DraggableCard({super.key, required this.child});
  final Widget child;

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  var _dradAlignment = Alignment.center;
  late AnimationController _controller;
  late Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..addListener(() {
            setState(() {
              _dradAlignment = _animation.value;
            });
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _runAnimation({required Offset pixelsPerSecond, required Size size}) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dradAlignment,
        end: Alignment.center,
      ).chain(CurveTween(curve: Curves.bounceOut)),
    );

    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final velocityPerSecond = unitsPerSecond.distance;

    final spring = SpringDescription(
      mass: 10,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(
      spring,
      0,
      1,
      -velocityPerSecond,
    );

    _controller.animateWith(simulation);
  }

  @override
  Widget build(BuildContext context) {
    //will use mediaquery to calculate the position of the card on the screen
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details) {
        _controller.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          _dradAlignment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.height / 2),
          );
        });
      },
      onPanEnd: (details) {
        _runAnimation(
          pixelsPerSecond: details.velocity.pixelsPerSecond,
          size: size,
        );
      },
      child: Align(
        alignment: _dradAlignment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }
}
