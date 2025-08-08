import 'package:anim_app/flutter_docs/hero_animations/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class RadialHeroAnimation extends StatelessWidget {
  const RadialHeroAnimation({super.key});

//radii
  static double minRadius = 50;
  static double maxRadius = 300;
  static Interval opacityCurve = Interval(0, 0.75, curve: Curves.fastOutSlowIn);
  @override
  Widget build(BuildContext context) {
    timeDilation = 3;
    return Scaffold(
      appBar: AppBar(
        title: Text('R A D I A L  H E R O'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Theme.of(context).colorScheme.surfaceContainer,
        alignment: FractionalOffset.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildHero(index: 0, context: context),
            _buildHero(index: 1, context: context),
            _buildHero(index: 2, context: context),
            _buildHero(index: 3, context: context),
          ],
        ),
      ),
    );
  }

  Widget _buildHero({
    required BuildContext context,
    required int index,
  }) {
    return SizedBox(
      width: minRadius,
      height: minRadius,
      child: Hero(
        createRectTween: (begin, end) {
          return MaterialRectCenterArcTween(begin: begin, end: end);
        },
        tag: Dash.values[index].photoName,
        child: ClipOval(
          child: Center(
            child: SizedBox(
              width: maxRadius,
              height: maxRadius,
              child: ClipRRect(
                child: Material(
                  color: Theme.of(context).primaryColor.withValues(
                        alpha: 0.25,
                      ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return AnimatedBuilder(
                                animation: animation,
                                builder: (context, child) {
                                  return Opacity(
                                    opacity:
                                        opacityCurve.transform(animation.value),
                                    child: AnotherDetailsPage(
                                      index: index,
                                      maxRadius: maxRadius,
                                    ),
                                  );
                                });
                          },
                        ),
                      );
                    },
                    child: Image.asset(
                      Dash.values[index].photoName,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnotherDetailsPage extends StatelessWidget {
  const AnotherDetailsPage({
    super.key,
    required this.maxRadius,
    required this.index,
  });
  final double maxRadius;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: maxRadius * 1.5,
                  width: maxRadius * 1.5,
                  child: Hero(
                    createRectTween: (begin, end) {
                      return MaterialRectCenterArcTween(begin: begin, end: end);
                    },
                    tag: Dash.values[index].photoName,
                    child: ClipOval(
                      child: Center(
                        child: SizedBox(
                          height: maxRadius,
                          width: maxRadius,
                          child: ClipRRect(
                            child: Material(
                              color: Theme.of(context).primaryColor.withValues(
                                    alpha: 0.25,
                                  ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                  Dash.values[index].photoName,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    Dash.values[index].title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    Dash.values[index].details,
                    style: TextStyle(),
                    textScaler: TextScaler.linear(1.5),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
