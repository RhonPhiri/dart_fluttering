import 'package:flutter/material.dart';
import 'package:flutter_quiz/constants.dart';
import 'package:flutter_quiz/question/view/question_view_model.dart';
import 'package:flutter_quiz/question/widget/answer_card.dart';
import 'package:flutter_quiz/question/widget/status_bar.dart';
import 'question_card.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  //initialize the viewmodel
  late final QuestionViewModel viewModel = QuestionViewModel(
    onGameOver: _handleGameOver,
  );
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
                onPressed: () {
                  viewModel.hasNextQuestion && viewModel.didAnswerQuestion
                      ? viewModel.getNextQuestion()
                      : null;
                },
                label: Text("Next"),
                icon: Icon(Icons.skip_next),
              ),
            ],
          ),

          body: Center(
            child: Column(
              children: [
                sizedBH16,
                QuestionCard(question: viewModel.currentQuestion?.question),
                Spacer(),
                AnswerCards(
                  answers: viewModel.currentQuestion?.possibleAnswers ?? [],
                  onTap: (value) => viewModel.checkAnswer(value),
                  correctAnswer: viewModel.didAnswerQuestion
                      ? viewModel.currentQuestion?.correctAnswer
                      : null,
                ),
                Spacer(),
                StatusBar(viewModel: viewModel),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleGameOver() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Game Over"),
        content: Text("Score: ${viewModel.score}"),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            label: Text("Ok"),
            icon: Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}
