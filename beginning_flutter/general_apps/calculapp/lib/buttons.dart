import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
    required this.changeTheme,
  });
  final void Function(bool) changeTheme;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isBright = Theme.of(context).brightness == Brightness.light;
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.light_mode_outlined,
                color: isBright ? colorScheme.onPrimary : colorScheme.secondary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.dark_mode_outlined,
                color: isBright ? colorScheme.secondary : colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
      onTap: () => changeTheme(!isBright),
    );
  }
}

class NumberButtons extends StatelessWidget {
  const NumberButtons({
    super.key,
    required this.index,
    required this.numberButtonTapped,
    required this.clearQuestionAndAnswer,
    required this.deleteCharacter,
    required this.displayAnswer,
    required this.answerToQuestion,
    required this.usePercent,
  });
  final int index;
  final void Function(String) numberButtonTapped;
  final void Function() clearQuestionAndAnswer;
  final void Function() deleteCharacter;
  final void Function() displayAnswer;
  final void Function() answerToQuestion;
  final void Function() usePercent;
  static const buttons = <String>[
    'AC',
    'DEL',
    '%',
    '\u00F7',
    '7',
    '8',
    '9',
    '\u00D7',
    '6',
    '5',
    '4',
    '\u2212',
    '1',
    '2',
    '3',
    '+',
    '.',
    '0',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    final isBright = Theme.of(context).brightness == Brightness.light;
    final colorScheme = Theme.of(context).colorScheme;
    Color buttonTextColor(int index) {
      Color color = colorScheme.onPrimary;
      if (index == 0 || index == 1 || index == 2) {
        color = Colors.teal.shade300;
      } else if (index == 3 ||
          index == 7 ||
          index == 11 ||
          index == 15 ||
          index == 19) {
        color = Colors.red.shade300;
      }
      return color;
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: isBright ? colorScheme.secondary : colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              buttons[index],
              style: TextStyle(fontSize: 32, color: buttonTextColor(index)),
            ),
          ),
        ),
        onTap: () {
          if (buttons[index] == 'AC') {
            clearQuestionAndAnswer();
          } else if (buttons[index] == 'DEL') {
            deleteCharacter();
          } else if (buttons[index] == '=') {
            displayAnswer();
          } else if (buttons[index] == 'ANS') {
            answerToQuestion();
          } else if (buttons[index] == '%') {
            usePercent();
          } else {
            numberButtonTapped(buttons[index]);
          }
        },
      ),
    );
  }
}
