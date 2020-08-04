import 'dart:math';
import 'history_list.dart';

class Game {
  static KoreanHistory history = new KoreanHistory();
  static List<int> years = history.getYears();
  static List<List<String>> events = history.getEvents();

  int answer = 0;

  Game() {
    answer = getRandomYear();
  }

  int getAnswer() {
    return answer;
  }

  int getRandomYear() {
    Random rand = new Random();
    int year = 0;
    do {
      year = rand.nextInt(years.length);
    } while (!isPlayable(years[year]));
    return years[year];
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
}
