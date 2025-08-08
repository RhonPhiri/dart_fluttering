import 'package:flutter/material.dart';
import 'package:flutter_quiz/question/widget/question_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("✏️", style: textTheme.displayLarge),
            Text(
              "Flutter Quiz",
              style: textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionScreen()),
              ),
              child: Text("New Game"),
            ),
          ],
        ),
      ),
    );
  }
}
