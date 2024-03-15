import 'dart:math';
import 'package:intl/intl.dart';

class AppFunctions {
  AppFunctions._();

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

  static String getMonthFormated(DateTime date) {
    var formatter = DateFormat("MMM", "es_CO");
    return formatter.format(date).toUpperCase();
  }

  static String getHourFormated(DateTime date) {
    var formatter = DateFormat('hh:mm a');
    return formatter.format(date).toLowerCase();
  }
}
