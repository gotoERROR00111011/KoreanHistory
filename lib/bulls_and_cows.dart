import 'dart:math';
import 'history_list.dart';

enum GameStatus {
  none,
  clear,
  same_number,
}

class Game {
  static KoreanHistory history = new KoreanHistory();
  List<int> years = history.getYears();

  int _gameAnswer = 0;
  List<int> answers = [];
  List<int> strikeCount = [];
  List<int> ballCount = [];

  Game() {
    _gameAnswer = getRandomYear();
  }

  int getAnswer() {
    return _gameAnswer;
  }

  int getCount() {
    return answers.length;
  }

  int getRandomYear() {
    Random rand = new Random();
    int year = 0;
    do {
      year = rand.nextInt(years.length);
    } while (!isPlayable(years[year]));
    return years[year];
  }

  int getPlayerAnswer(int index) {
    return answers[index];
  }

  int getStrike(int index) {
    return strikeCount[index];
  }

  int getBall(int index) {
    return ballCount[index];
  }

  GameStatus tryAnswer(int playerAnswer) {
    if (!isPlayable(playerAnswer)) {
      return GameStatus.same_number;
    }

    addScore(playerAnswer);
    addAnswer(playerAnswer);
    if (isClear(playerAnswer)) {
      return GameStatus.clear;
    }
    return GameStatus.none;
  }

  bool isClear(int playerAnswer) {
    if (_gameAnswer == playerAnswer) {
      return true;
    } else {
      return false;
    }
  }

  bool isPlayable(int year) {
    List<int> number = splitYear(year);
    for (int i = 0; i < 4; ++i) {
      for (int j = i + 1; j < 4; ++j) {
        if (number[i] == number[j]) {
          return false;
        }
      }
    }
    return true;
  }

  List<int> splitYear(int year) {
    List<int> number = [0, 0, 0, 0];
    for (int i = 3; i >= 0; --i) {
      number[i] = year % 10;
      year = year ~/ 10;
    }
    return number;
  }

  void addScore(int playerAnswer) {
    int strike = 0;
    int ball = 0;
    List<int> game = splitYear(_gameAnswer);
    List<int> player = splitYear(playerAnswer);
    for (int i = 0; i < 4; ++i) {
      for (int j = 0; j < 4; ++j) {
        if (game[i] == player[j]) {
          if (i == j) {
            strike++;
          } else {
            ball++;
          }
        }
      }
    }
    addStirke(strike);
    addBall(ball);
  }

  void addAnswer(int playerAnswer) {
    answers.add(playerAnswer);
  }

  void addStirke(int count) {
    strikeCount.add(count);
  }

  void addBall(int count) {
    ballCount.add(count);
  }
}
