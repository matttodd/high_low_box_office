import 'dart:math' as math;
import 'package:high_low_box_office/model/movie.dart';
import 'package:high_low_box_office/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MovieModel {
  Movie? leftMovie;
  Movie? rightMovie;
  Movie? upNextMovie;
  SharedPreferences? prefs;
  Set<String> filmsUsed = {};
  int score = 0;
  int highScore = 0;
  bool hasLost = false;

  MovieModel();

  Future loadStartingData() async {
    List<Future> futures = [];
    leftMovie = Movie(filmsUsed);
    futures.add(leftMovie!.loadJSONData());
    // filmsUsed.add(leftMovie.title);
    rightMovie = Movie(filmsUsed);
    futures.add(rightMovie!.loadJSONData());
    // filmsUsed.add(rightMovie.title);
    upNextMovie = Movie(filmsUsed);
    futures.add(upNextMovie!.loadJSONData());
    // filmsUsed.add(upNextMovie.title);
    var highScoreFuture = getHighScore();
    futures.add(highScoreFuture);

    return Future.wait(futures);
  }

  Future getHighScore() async {
    prefs = await SharedPreferences.getInstance();
    highScore = prefs?.getInt(kHighScoreKey) ?? math.max(score, highScore);
  }

  void makeGuess(Guess guess) {
    if (hasLost) {
      return;
    }

    var selected = guess == Guess.left ? leftMovie : rightMovie;
    var other = guess == Guess.left ? rightMovie : leftMovie;

    if (selected!.boxOfficeNumeral() >= other!.boxOfficeNumeral()) {
      score += 1;
      if (score > highScore) {
        highScore += 1;
        prefs?.setInt(kHighScoreKey, highScore);
      }
      leftMovie = rightMovie;
      rightMovie = upNextMovie;
      try {
        upNextMovie = Movie(filmsUsed);
        upNextMovie!.loadJSONData();
      } catch (error) {
        rethrow;
      }
    } else {
      hasLost = true;
    }
  }
}