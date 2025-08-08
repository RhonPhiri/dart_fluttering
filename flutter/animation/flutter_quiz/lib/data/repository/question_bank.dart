import 'package:flutter_quiz/data/model/question_model.dart';
import 'package:flutter_quiz/data/repository/questions_repository.dart';
import 'dart:math' as math;

class QuestionBank {
  //A variable to hold the list of questions
  final List<Question> _questions = createQuestions();

  //Check if there is a next question by checking if the list of questions is not empty
  bool get hasNextQuestion => _questions.isNotEmpty;
  //Check the nummber of questions remaining by checking the length of the list
  int get remainingQuestions => _questions.length;

  //Method to retain a random question. null will be returned if the list of questions is empty
  Question? getRandomQuestion() {
    if (_questions.isEmpty) {
      return null;
    }

    //variable to hold a random number in between the length of the question list
    final i = math.Random().nextInt(_questions.length);

    final randomQuestion = _questions[i];

    //remove the randomQuestion from the list of questions so that it shouldn't be retained
    _questions.removeAt(i);
    return randomQuestion;
  }
}
