import 'dart:math';

class AppFuntions {
  static final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );
  
  static int randomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(9999) + 1000;
    return randomNumber;
  }
}
