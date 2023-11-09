import 'dart:math';

class AppFuntions {
  static int randomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(9999) + 1000;
    return randomNumber;
  }
}
