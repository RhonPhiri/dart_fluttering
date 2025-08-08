import 'package:flutter/widgets.dart';
import 'package:flutter_quiz/data/model/question_model.dart';
import 'package:flutter_quiz/data/repository/question_bank.dart';

class QuestionViewModel with ChangeNotifier {
  //Initialize the question bank
  final QuestionBank _questionBank = QuestionBank();
  final VoidCallback onGameOver;
  late final int totalQuestions;
  Question? currentQuestion;
  int answeredQuestionCount = 0;

  //Variable to hold the score
  int score = 0;

  bool didAnswerQuestion = false;

  bool get hasNextQuestion => answeredQuestionCount < totalQuestions;

  QuestionViewModel({required this.onGameOver}) {
    totalQuestions = _questionBank.remainingQuestions;
    getNextQuestion();
  }

  void getNextQuestion() {
    if (_questionBank.hasNextQuestion) {
      currentQuestion = _questionBank.getRandomQuestion();
      answeredQuestionCount++;
    }

    didAnswerQuestion = false;

    notifyListeners();
  }

  //Check if the selected index of the list of questions is equal to the correct answer
  void checkAnswer(int selectedIndex) {
    if (!didAnswerQuestion && currentQuestion?.correctAnswer == selectedIndex) {
      score++;
    }
    didAnswerQuestion = true;

    if (!_questionBank.hasNextQuestion) {
      onGameOver();
    }
    notifyListeners();
  }
}
