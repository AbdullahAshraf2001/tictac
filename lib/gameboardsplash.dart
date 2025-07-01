import 'package:flutter/material.dart';
import 'package:tictac/GameBoard.dart';
import 'package:tictac/gameboardargs.dart';

class Gameboardsplash extends StatelessWidget {
  static String routeName = "Gameboardsplash";
  TextEditingController player1Controller = TextEditingController();
  String player2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: TextField(
              controller: player1Controller,
              decoration: InputDecoration(labelText: "Enter your Name"),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: TextField(
              onChanged: (text) {
                player2 = text;
              },
              decoration: InputDecoration(labelText: "Enter your Name"),
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.all(18),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  GameBoard.routeName,
                  arguments: GameBoardArgs(player1Controller.text, player2),
                );
              },
              child: Text("Start", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
