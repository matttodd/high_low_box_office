import 'package:flutter/material.dart';
import 'package:high_low_box_office/components/visibility_text_widget.dart';
import 'package:high_low_box_office/constants.dart';
import 'package:high_low_box_office/screens/game_screen.dart';

import '../components/promo_row.dart';

class LoseScreen extends StatelessWidget {
  final int score;

  const LoseScreen({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/gameover.jpg"),
              fit: BoxFit.cover,
              opacity: 75.0
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(),
            Center(
              child: Column(
                children: [
                  const VisibilityText(
                    'GAME OVER',
                    style: kTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  VisibilityText(
                    'YOUR SCORE: $score',
                    style: kSubTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GameScreen()),
                      );
                    },
                    child: const VisibilityText(
                      'PLAY AGAIN',
                      style: kStartButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            const PromoRow(),
          ],
        ),
      ),
    );
  }
}
