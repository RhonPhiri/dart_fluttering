import 'package:flutter/material.dart';
import 'package:flutter_quiz/question/view/question_view_model.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({super.key, required this.viewModel});
  final QuestionViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Question: ${viewModel.answeredQuestionCount}/${viewModel.totalQuestions}",
            ),
            Text("Score: ${viewModel.score}"),
          ],
        ),
      ),
    );
  }
}
