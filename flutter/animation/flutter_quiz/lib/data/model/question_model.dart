//class for a question
//A question, list of possible answers and the correct answer is required
class Question {
  final String question;
  final List<String> possibleAnswers;
  final int correctAnswer;

  Question({
    required this.question,
    required this.possibleAnswers,
    required this.correctAnswer,
  });
}
