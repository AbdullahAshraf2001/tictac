import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Gameboardbutton extends StatelessWidget {
  String symbol;
  Function onClick;
  int index;

  Gameboardbutton({
    super.key,
    required this.symbol,
    required this.onClick,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Icon? icon;
    if (symbol == 'X') {
      icon = Icon(Icons.close_outlined, color: Colors.red, size: 50);
    } else if (symbol == 'O') {
      icon = Icon(Icons.panorama_fisheye_rounded, color: Colors.blue, size: 50);
    }

    return Expanded(
      child: InkWell(
        onTap: () => onClick(index),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          child: Center(child: icon),
        ),
      ),
    );
  }
}
