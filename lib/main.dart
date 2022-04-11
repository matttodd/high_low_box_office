import 'package:flutter/material.dart';
import 'screens/start_screen.dart';

void main() => runApp(const HighLowGame());

class HighLowGame extends StatelessWidget {
  const HighLowGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        fontFamily: 'Righteous'
      ),
      home: const StartScreen(),
    );
  }
}