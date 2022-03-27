import 'package:flutter/material.dart';
import 'package:high_low_box_office/constants.dart';
import 'package:high_low_box_office/screens/start_screen.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

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
                  'ERROR!',
                  style: kTitleTextStyle,
                ),
                const Text(
                  'OOPS SOMETHING WENT BAD',
                  style: kSubTitleTextStyle,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const StartScreen()),
                    );
                  },
                  child: const Text(
                    'GO BACK',
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
