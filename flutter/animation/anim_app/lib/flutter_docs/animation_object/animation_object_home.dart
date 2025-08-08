import 'package:anim_app/flutter_docs/animation_object/explicit_animation_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'impliciti_animation_page.dart';

class AnimationObjectHome extends StatelessWidget {
  const AnimationObjectHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("A N I M A T I O N  O B J E C T"),
        elevation: 4,
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
                  // height: 2,
                ),
                children: [
                  TextSpan(
                    text: 'Animations may be drawn '
                        'or code based. For vector or drawn based'
                        ' animations, Use the third party packages e.g'
                        '\nRive, Lottie and other Animation packages on Pub Dev.\n\n'
                        'If the animations are code based, then they are grouped into:\n\n1. ',
                  ),
                  TextSpan(
                    text: 'Implicit Animation\n\n',
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return ImplicitAnimationPage();
                            },
                          ),
                        );
                      },
                  ),
                  TextSpan(text: '2. '),
                  TextSpan(
                    text: 'Explicit Animation\n\n',
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: ExplicitAnimationPage(),
                              );
                            },
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return ExplicitAnimationPage();
                            },
                          ),
                        );
                      },
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
