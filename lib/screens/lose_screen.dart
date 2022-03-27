import 'package:flutter/material.dart';
import 'package:high_low_box_office/constants.dart';
import 'package:high_low_box_office/screens/game_screen.dart';

class LoseScreen extends StatelessWidget {
  final int score;

  const LoseScreen({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Column(
              children: [
                const Text(
                  'GAME OVER',
                  style: kTitleTextStyle,
                ),
                Text(
                  'YOUR SCORE: $score',
                  style: kSubTitleTextStyle,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GameScreen()),
                    );
                  },
                  child: const Text(
                    'PLAY AGAIN',
                    style: kStartButtonTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
