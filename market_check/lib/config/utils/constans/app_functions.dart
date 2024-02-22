import 'dart:math';

class AppFuntions {
  AppFuntions._();

  static final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  static int randomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(9999) + 1000;
    return randomNumber;
  }

  static const Map<int, String> mothNameMap = {
    1: 'Enero',
    2: 'Febrero',
    3: 'Marzo',
    4: 'Abril',
    5: 'Mayo',
    6: 'Junio',
    7: 'Julio',
    8: 'Agosto',
    9: 'Septiembre',
    10: 'Octubre',
    11: 'Noviembre',
    12: 'Diciembre',
  };
}
