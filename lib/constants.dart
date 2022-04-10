import 'package:flutter/material.dart';

enum Guess {
  left,
  right
}

const kAppBarColor = Color(0xFF111328);
const kHighScoreKey = 'high-score';
const kWinnerFontSize = 70.0;
const kLoserFontSize = 50.0;
const kWinnerColor = Colors.green;
const kLoseColor = Colors.red;

const kSubTitleTextStyle = TextStyle(
  color: Color(0xFF9DE7B9),
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 80.0,
  fontWeight: FontWeight.bold,
);

const kStartButtonTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 45.0,
);

const kMovieTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 60.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Righteous'
);

const kMovieDataTextStyle = TextStyle(
  color: Colors.white70,
  fontSize: 30.0,
);

const kMovieBoxOfficeTextStyle = TextStyle(
  color: Colors.yellow,
  fontSize: 70.0,
  fontWeight: FontWeight.bold,
);

const kPromoTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
);