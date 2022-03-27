import 'package:flutter/material.dart';
import 'package:high_low_box_office/constants.dart';
import 'package:high_low_box_office/model/movie_model.dart';
import 'package:high_low_box_office/screens/error.dart';
import 'dart:math' as math;

import 'package:high_low_box_office/screens/lose_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late MovieModel _model;
  bool isWaiting = false;

  @override
  initState() {
    _model = MovieModel();
    super.initState();
    waitForModel();
  }

  waitForModel() async {
    isWaiting = true;
    try {
      await _model.loadStartingData();
      setState(() {});
      isWaiting = false;
    } catch (error) {
      print(error);
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => const ErrorScreen()),);
      isWaiting = false;
    }
  }

  void handleLoss() {
    if (_model.hasLost) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LoseScreen(score: _model.score,)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Row(
              children: [
                Text("High Score: ${_model.highScore}", style: kSubTitleTextStyle),
                const Spacer(),
                Text("Score: ${_model.score}", style: kSubTitleTextStyle),
                const SizedBox(
                  width: 50,
                ),
              ],
            ),
        automaticallyImplyLeading: false,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _model.makeGuess(Guess.left);
                });
                handleLoss();
              },
              child: Container(
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_model.leftMovie!.title, style: kSubTitleTextStyle,),
                      Text(isWaiting ? "?" : _model.leftMovie!.release!, style: kSubTitleTextStyle,),
                      Text(isWaiting ? "?" : _model.leftMovie!.boxOffice!, style: kSubTitleTextStyle,),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _model.makeGuess(Guess.right);
                });
                handleLoss();
              },
              child: Container(
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_model.rightMovie!.title, style: kSubTitleTextStyle,),
                      Text(isWaiting ? "?" : _model.rightMovie!.release!, style: kSubTitleTextStyle,)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
