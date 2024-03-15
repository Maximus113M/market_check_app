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
    1: 'ENE.',
    2: 'FEB.',
    3: 'MAR.',
    4: 'ABR.',
    5: 'MAYO',
    6: 'JUN.',
    7: 'JUL.',
    8: 'AGOST.',
    9: 'SEPT.',
    10: 'OCT.',
    11: 'NOV.',
    12: 'DIC.',
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
