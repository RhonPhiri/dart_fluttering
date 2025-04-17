import 'package:calculapp/buttons.dart';
import 'package:calculapp/history_page.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.changeTheme});
  final void Function(bool) changeTheme;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StringBuffer question = StringBuffer();
  String finalAnswer = '';
  List<String> answers = [];

  //method to add characters to the question
  void numberButtonTapped(String buttonCharacter) {
    setState(() {
      question.write(buttonCharacter);
    });
  }

  //method to delete the question and answer
  void clearQuestionAndAnswer() {
    setState(() {
      question.clear();
      finalAnswer = '';
    });
  }

  //method to delete a charater from the question
  void deleteCharacter() {
    final currentQuestion = question.toString();
    setState(() {
      question.clear();
      if (currentQuestion.isNotEmpty) {
        question.write(
          currentQuestion.substring(0, currentQuestion.length - 1),
        );
      }
    });
  }

  //method to display answer
  void displayAnswer() async {
    final firstReplacement = question.toString().replaceAll('\u00F7', '/');
    final secondReplacement = firstReplacement.replaceAll('\u00D7', '*');
    final thirdReplacement = secondReplacement.replaceAll('\u2212', '-');
    final fourthReplacement = thirdReplacement.replaceAll('%', '/100');

    setState(() {
      Parser p = Parser();
      Expression exp = p.parse(fourthReplacement);
      double answer = exp.evaluate(EvaluationType.REAL, ContextModel());
      final myAnswer = answer.toStringAsFixed(1);
      finalAnswer = myAnswer;
    });
    answers.add(finalAnswer);
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('answer', answers);
  }

  //method to make the answer become the question
  void answerToQuestion() {
    setState(() {
      question.clear();
      question.write(finalAnswer);
      finalAnswer = '';
    });
  }

//method to turn question into percentage
  void usePercent() {
    setState(() {
      question.write('%');
      displayAnswer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Spacer(),
          ThemeButton(changeTheme: widget.changeTheme),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryPage(
                          answers: answers,
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.history),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    question.toString(),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    finalAnswer,
                    style: textTheme.displayLarge,
                  ),
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 4 / 5,
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: GridView.builder(
                  itemCount: 20,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return NumberButtons(
                      index: index,
                      numberButtonTapped: (p0) => numberButtonTapped(p0),
                      clearQuestionAndAnswer: () => clearQuestionAndAnswer(),
                      deleteCharacter: () => deleteCharacter(),
                      displayAnswer: () => displayAnswer(),
                      answerToQuestion: () => answerToQuestion(),
                      usePercent: () => usePercent(),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
