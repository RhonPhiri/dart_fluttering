import '../model/question_model.dart';

//Method to create and return a list of Questions
List<Question> createQuestions() {
  return [
    Question(
      question: "What class is used to create custom animations in flutter?",
      possibleAnswers: [
        "AnimationController",
        "AnimatedWidget",
        "AnimatedBuilder",
        "Tween",
      ],
      correctAnswer: 0,
    ),
    Question(
      question:
          "Which widget is used to rebuil its child whenever an animation changes?",
      possibleAnswers: [
        "AnimatedContainer",
        "AnimatedBuilder",
        "AnimatedSwitcher",
        "AnimatedOpacity",
      ],
      correctAnswer: 1,
    ),
    Question(
      question:
          "What class is used to define the start and end values of an animation?",
      possibleAnswers: [
        "Tween",
        "Curve",
        "AnimatedController",
        "AnimatedWidget",
      ],
      correctAnswer: 0,
    ),
  ];
}
