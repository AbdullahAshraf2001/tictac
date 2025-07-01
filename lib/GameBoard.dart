import 'package:flutter/material.dart';
import 'package:tictac/gameboardargs.dart';
import 'package:tictac/gameboardbutton.dart';

class GameBoard extends StatefulWidget {
  static String routeName = "GameBoard";

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> board = ["", "", "", "", "", "", "", "", ""];
  int player1Score = 0;
  int player2Score = 0;

  int counter = 0;

  TextStyle playerNameTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    GameBoardArgs args =
        ModalRoute.of(context)!.settings.arguments as GameBoardArgs;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${args.player1Name} : $player1Score",
                    style: playerNameTextStyle,
                  ),
                  Text(
                    "${args.player2Name}: $player2Score",
                    style: playerNameTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gameboardbutton(
                  symbol: board[0],
                  onClick: onButtonClick,
                  index: 0,
                ),
                Gameboardbutton(
                  symbol: board[1],
                  onClick: onButtonClick,
                  index: 1,
                ),
                Gameboardbutton(
                  symbol: board[2],
                  onClick: onButtonClick,
                  index: 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gameboardbutton(
                  symbol: board[3],
                  onClick: onButtonClick,
                  index: 3,
                ),
                Gameboardbutton(
                  symbol: board[4],
                  onClick: onButtonClick,
                  index: 4,
                ),
                Gameboardbutton(
                  symbol: board[5],
                  onClick: onButtonClick,
                  index: 5,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gameboardbutton(
                  symbol: board[6],
                  onClick: onButtonClick,
                  index: 6,
                ),
                Gameboardbutton(
                  symbol: board[7],
                  onClick: onButtonClick,
                  index: 7,
                ),
                Gameboardbutton(
                  symbol: board[8],
                  onClick: onButtonClick,
                  index: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onButtonClick(int index) {
    if (board[index].isNotEmpty) return;
    String symbol = counter % 2 == 0 ? "X" : "O";
    board[index] = symbol;
    counter++;
    if (checkWinner(symbol)) {
      if (symbol == "X") {
        player1Score++;
        resetBoard();
      } else {
        player2Score++;
        resetBoard();
        return;
      }
    }
    if (counter == 9) {
      resetBoard();
    }
    setState(() {});
  }

  resetBoard() {
    board = ["", "", "", "", "", "", "", "", ""];
    counter = 0;
    setState(() {});
  }

  bool checkWinner(String symbol) {
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }

    for (var i = 0; i < 6; i += 3) {
      if (board[i] == symbol &&
          board[i + 1] == symbol &&
          board[i + 2] == symbol) {
        return true;
      }
    }
    for (var i = 0; i < 3; i++) {
      if (board[i] == symbol &&
          board[i + 3] == symbol &&
          board[i + 6] == symbol) {
        return true;
      }
    }
    return false;
  }
}
