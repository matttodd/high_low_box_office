import 'package:flutter/material.dart';

import '../components/visibility_text_widget.dart';
import '../constants.dart';
import '../model/movie_model.dart';
import 'error.dart';
import 'lose_screen.dart';
import '../model/movie.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with SingleTickerProviderStateMixin {
  late MovieModel _model;
  bool isWaiting = false;
  bool hasRevealed = false;

  @override
  initState() {
    _model = MovieModel();
    super.initState();
    waitForModel();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  TextStyle revealedStyle(Movie? targetMovie, Movie? secondaryMovie) {
    if (targetMovie == null || secondaryMovie == null) {
      return kMovieTitleTextStyle;
    }
    var isWinner =
        targetMovie.boxOfficeNumeral() >= secondaryMovie.boxOfficeNumeral();
    return kMovieTitleTextStyle.copyWith(
      fontSize: isWinner ? kWinnerFontSize : kLoserFontSize,
      color: isWinner ? kWinnerColor : kLoseColor,
    );
  }

  waitForModel() async {
    isWaiting = true;
    try {
      await _model.loadStartingData();
      setState(() {});
      isWaiting = false;
    } catch (error) {
      print(error);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ErrorScreen()),
      );
      isWaiting = false;
    }
  }

  void handleLoss() {
    if (_model.hasLost) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LoseScreen(
                  score: _model.score,
                )),
      );
    }
  }

  void handleAction(Guess guess) async {
    if (hasRevealed) return;
    setState(() {
      hasRevealed = true;
    });
    await Future.delayed(const Duration(milliseconds: 2000));
    _controller.forward();
    await Future.delayed(const Duration(milliseconds: 500));
    _controller.reset();
    setState(() {
      _model.makeGuess(guess);
      hasRevealed = false;
    });
    handleLoss();
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(-0.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Row(
          children: [
            Text("High Score: ${_model.highScore}", style: kMovieDataTextStyle),
            const Spacer(),
            const Text("Click the higher grossing film!",
                style: kMovieDataTextStyle),
            const Spacer(),
            Text("Score: ${_model.score}", style: kMovieDataTextStyle),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SlideTransition(
        position: _offsetAnimation,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                handleAction(Guess.left);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: _model.leftMovie?.poster ??
                      const AssetImage('images/transparent.png'),
                )),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedDefaultTextStyle(
                          duration:
                              Duration(milliseconds: hasRevealed ? 1500 : 0),
                          curve: Curves.easeInOutQuint,
                          style: hasRevealed
                              ? revealedStyle(
                                  _model.leftMovie, _model.rightMovie)
                              : kMovieTitleTextStyle,
                          child: VisibilityText(_model.leftMovie?.title ?? "?"),
                        ),
                        const SizedBox(height: 20),
                        VisibilityText(
                          isWaiting ? "?" : _model.leftMovie?.release ?? "?",
                          style: kMovieDataTextStyle,
                        ),
                        const SizedBox(height: 20),
                        VisibilityText(
                          isWaiting ? "?" : _model.leftMovie?.synopsis ?? "?",
                          style: kMovieDataTextStyle,
                        ),
                        const SizedBox(height: 20),
                        VisibilityText(
                          isWaiting ? "?" : _model.leftMovie?.boxOffice ?? "?",
                          style: kMovieBoxOfficeTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                handleAction(Guess.right);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: _model.rightMovie?.poster ??
                      const AssetImage('images/transparent.png'),
                )),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedDefaultTextStyle(
                          duration:
                              Duration(milliseconds: hasRevealed ? 1500 : 0),
                          curve: Curves.easeInOutQuint,
                          style: hasRevealed
                              ? revealedStyle(
                                  _model.rightMovie, _model.leftMovie)
                              : kMovieTitleTextStyle,
                          child:
                              VisibilityText(_model.rightMovie?.title ?? "?"),
                        ),
                        const SizedBox(height: 20),
                        VisibilityText(
                          isWaiting ? "?" : _model.rightMovie?.release ?? "?",
                          style: kMovieDataTextStyle,
                        ),
                        const SizedBox(height: 20),
                        VisibilityText(
                          isWaiting ? "?" : _model.rightMovie?.synopsis ?? "?",
                          style: kMovieDataTextStyle,
                        ),
                        const SizedBox(height: 20),
                        AnimatedOpacity(
                          opacity: hasRevealed ? 1.0 : 0,
                          duration:
                              Duration(milliseconds: hasRevealed ? 500 : 0),
                          child: VisibilityText(
                            isWaiting
                                ? "?"
                                : _model.rightMovie?.boxOffice ?? "?",
                            style: kMovieBoxOfficeTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: _model.upNextMovie?.poster ??
                    const AssetImage('images/transparent.png'),
              )),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      VisibilityText(
                        _model.upNextMovie?.title ?? "?",
                        style: kMovieTitleTextStyle,
                      ),
                      const SizedBox(height: 20),
                      VisibilityText(
                        isWaiting ? "?" : _model.upNextMovie?.release ?? "?",
                        style: kMovieDataTextStyle,
                      ),
                      const SizedBox(height: 20),
                      VisibilityText(
                        isWaiting ? "?" : _model.upNextMovie?.synopsis ?? "?",
                        style: kMovieDataTextStyle,
                      ),
                      const SizedBox(height: 20),
                      AnimatedOpacity(
                        opacity: hasRevealed ? 0 : 0,
                        duration: const Duration(milliseconds: 0),
                        child: VisibilityText(
                          isWaiting ? "?" : _model.upNextMovie?.boxOffice ?? "?",
                          style: kMovieBoxOfficeTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
