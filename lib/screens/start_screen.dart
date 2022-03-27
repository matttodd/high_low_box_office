import 'package:flutter/material.dart';
import 'package:high_low_box_office/constants.dart';
import 'package:high_low_box_office/screens/game_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

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
                  'HIGHER LOWER',
                  style: kTitleTextStyle,
                ),
                const Text(
                  'BOX OFFICE',
                  style: kSubTitleTextStyle,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const GameScreen()),
                    );
                  },
                  child: const Text(
                    'Begin',
                    style: kStartButtonTextStyle,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
