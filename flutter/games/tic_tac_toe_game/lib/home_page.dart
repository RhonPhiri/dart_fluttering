import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<List<String>> board;
  late String currentPlayer;

  @override
  void initState() {
    super.initState();
    initializeGame();
  }

  void initializeGame() {
    board = List.generate(
      3,
      (_) => List.filled(3, ''),
    );
    currentPlayer = 'X';
  }

  static TextStyle newFontStyle = TextStyle(
    fontFamily: 'PressStart2P',
    fontSize: 24,
  );

  int playerXScore = 0;
  int playerOScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Score Board', style: newFontStyle),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Player O', style: newFontStyle),
                        Text('$playerOScore', style: newFontStyle)
                      ],
                    ),
                    Column(
                      children: [
                        Text('Player X', style: newFontStyle),
                        Text('$playerXScore', style: newFontStyle),
                      ],
                    ),
                  ],
                )
              ],
            )),
            Expanded(
              flex: 3,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  final row = index ~/ 3;
                  final col = index % 3;
                  return GestureDetector(
                    onTap: () => _cellTapped(row, col),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      child: Center(
                          child: Text(
                        // '$index',
                        board[row][col],
                        style: TextStyle(
                          fontFamily: 'Ledger',
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Tic Tac Toe', style: newFontStyle),
                  Text('@CREATEDBYRHON', style: newFontStyle),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 40.0,
                        right: 40,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              'Quit GAME',
                              style: TextStyle(
                                fontFamily: 'PressStart2P',
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _cellTapped(int row, int col) {
    if (board[row][col].isEmpty) {
      setState(() {
        board[row][col] = currentPlayer;
        currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
      });
    }
    String winner = _checkForWinner();
    if (winner.isNotEmpty) {
      _showWinnerDialog(winner);
    }
  }

  String _checkForWinner() {
    for (var i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] &&
          board[i][1] == board[i][2] &&
          board[i][0].isNotEmpty) {
        return board[i][0];
      } else if (board[0][i] == board[1][i] &&
          board[1][i] == board[2][i] &&
          board[0][i].isNotEmpty) {
        return board[0][i];
      }
    }
    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0].isNotEmpty) {
      return board[0][0];
    }
    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2].isNotEmpty) {
      return board[0][2];
    }
    bool isDraw = true;
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        if (board[i][j].isEmpty) {
          isDraw = false;
          break;
        }
      }
    }
    if (isDraw) {
      return 'Draw';
    }
    return '';
  }

  void _showWinnerDialog(String winner) {
    winner == 'X'
        ? (playerXScore += 1)
        : winner == 'O'
            ? (playerOScore += 1)
            : null;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over!'),
          content: Text(
            winner == 'Draw' ? 'It\'s a draw' : 'Player $winner Wins!',
          ),
          actions: [
            TextButton(
              onPressed: _resetGame,
              child: Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  void _resetGame() {
    setState(() {
      initializeGame();
      Navigator.pop(context);
    });
  }
}
