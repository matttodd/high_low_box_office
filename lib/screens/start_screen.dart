import 'package:flutter/material.dart';
import '../components/visibility_text_widget.dart';
import '../constants.dart';
import 'game_screen.dart';
import '../components/promo_row.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bridge.jpg"),
            fit: BoxFit.cover,
            opacity: 90.0
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
                    'HIGHER LOWER',
                    style: kTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const VisibilityText(
                    'BOX OFFICE',
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
                      'Begin',
                      style: kStartButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            const PromoRow()
          ],
        ),
      ),
    );
  }
}
