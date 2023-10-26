// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int leftDice = 1;
  int rightDice = 1;
  int score = 0;

  void onTap() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
      score = leftDice + rightDice;
    });
  }

  void onDoubleTab() {
    setState(() {
      leftDice = 2;
      rightDice = 2;
      score = leftDice + rightDice;
    });
  }

  void onLongPress() {
    setState(() {
      leftDice = 6;
      rightDice = 6;
      score = leftDice + rightDice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Roll The Dice",
              style: TextStyle(
                  color: Colors.white, fontSize: 40, fontFamily: 'Pacifico'),
            ),
            Center(
              child: InkWell(
                splashColor: Colors.deepOrange.shade900,
                onDoubleTap: onDoubleTab,
                onLongPress: onLongPress,
                onTap: onTap,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage('images/dice$leftDice.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage('images/dice$rightDice.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Score : $score',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'SourceCodePro'),
            )
          ],
        ),
      ),
    );
  }
}
