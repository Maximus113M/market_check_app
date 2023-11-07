import 'package:flutter/material.dart';

final DateTime date = DateTime.now();

const List<Color> colorList = [
  Colors.blue,
  Colors.yellow,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  const AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0, 'SelectedColor must be greater then 0'),
        assert(selectedColor < colorList.length,
            'SelectedColor must be less or equal than ${colorList.length - 1}');

  ThemeData getThemeData() => ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false),
      fontFamily: 'CustomFont');

  //Funcion que crea una copia del estado anterior y pide los parametros opcionales al cambio
  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode);
}
