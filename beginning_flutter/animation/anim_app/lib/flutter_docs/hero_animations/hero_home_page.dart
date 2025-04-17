import 'package:anim_app/flutter_docs/hero_animations/radial_hero_animation.dart';
import 'package:anim_app/flutter_docs/hero_animations/standard_hero_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HeroHomePage extends StatelessWidget {
  const HeroHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('H E R O  A N I M A T I O N S'),
        elevation: 4,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: 'Hero',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' animations allow trasnitions from one screen to another with a widget flying inbetween those screens.',
                  ),
                  TextSpan(
                    text:
                        ' \nThey come in many forms but only two have been presented here;',
                  ),
                  TextSpan(
                    text: '\n1. ',
                    style: TextStyle(
                      height: 2,
                    ),
                  ),
                  TextSpan(
                    text: 'Standard Hero Animation',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return StandardHeroAnimation();
                        }));
                      },
                  ),
                  TextSpan(
                    text: '\n2. ',
                    style: TextStyle(
                      height: 2,
                    ),
                  ),
                  TextSpan(
                      text: 'Radial Hero Animation',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return RadialHeroAnimation();
                          }));
                        }),
                  TextSpan(
                    text: '\nClick on either to check them out!',
                    style: TextStyle(height: 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
