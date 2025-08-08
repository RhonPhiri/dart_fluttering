import 'package:flutter/material.dart';

class AnswerCards extends StatelessWidget {
  const AnswerCards({
    super.key,
    required this.answers,
    required this.onTap,
    required this.correctAnswer,
  });
  final List<String> answers;
  final ValueChanged<int> onTap;
  final int? correctAnswer;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 5 / 2,
      children: List.generate(answers.length, (int index) {
        Color color = Theme.of(context).colorScheme.primaryContainer;
        if (correctAnswer == index) {
          color = Theme.of(context).colorScheme.tertiaryContainer;
        }
        return Card.filled(
          key: ValueKey(answers[index]),
          color: color,
          elevation: 2,
          margin: EdgeInsets.all(8),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () => onTap(index),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  answers.length > index ? answers[index] : '',
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
