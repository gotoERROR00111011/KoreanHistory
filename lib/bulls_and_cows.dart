import 'dart:math';
import 'history_list.dart';

class Game {
  static KoreanHistory history = new KoreanHistory();
  static List<int> year = history.getYears();
  static List<List<String>> events = history.getEvents();

  int getRandomYear() {
    Random rand = new Random();
    int year = rand.nextInt(history.getToday());
    return year;
  }
}
