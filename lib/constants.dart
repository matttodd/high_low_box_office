import 'package:flutter/material.dart';

const String APIKEY = "REDACTED";

enum Guess {
  left,
  right
}

const kCardColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF111328);
const kBottomButtonColor = Color(0xFFEB1555);
const kBottomButtonHeight = 80.0;
const kHighScoreKey = 'high-score';

const kSubTitleTextStyle = TextStyle(
  color: Color(0xFF4A6C59),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 50.0,
  fontWeight: FontWeight.bold,

);

const kStartButtonTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 30.0,
  // fontWeight: FontWeight.bold,

);