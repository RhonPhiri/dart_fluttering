import 'package:flutter/material.dart';
import 'package:flutter_quiz/constants.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, this.question});
  final String? question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padAll16,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: padAll16,
          child: Text(
            question ?? '',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
