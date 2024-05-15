import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightMode = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromARGB(255, 160, 182, 202),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black)),
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: const Color.fromARGB(255, 160, 182, 202),
      primary: const Color.fromARGB(255, 0, 0, 0),
      secondary: Color.fromARGB(255, 16, 116, 248),
      primaryContainer: const Color.fromARGB(255, 255, 107, 1),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 64, 122, 138),
        extendedTextStyle:
            TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
  );
//------------------------------------------------------------------------------
  ThemeData darkMode = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromARGB(255, 42, 11, 71),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white)),
    colorScheme: ColorScheme.dark(
      background: Color.fromARGB(255, 42, 11, 71),
      primary: Colors.white,
      secondary: Colors.blueAccent.shade700,
      primaryContainer: const Color.fromARGB(255, 255, 107, 1),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 170, 150, 89),
        extendedTextStyle:
            TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
  );
}
