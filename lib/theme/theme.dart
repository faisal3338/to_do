import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightMode = ThemeData(
    appBarTheme:
        AppBarTheme(backgroundColor: Color.fromARGB(255, 248, 251, 255)),
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: const Color.fromARGB(255, 248, 251, 255),
      primary: const Color.fromARGB(255, 0, 0, 0),
      secondary: Color.fromARGB(255, 16, 116, 248),
      primaryContainer: const Color.fromARGB(255, 255, 107, 1),
    ),
  );

  ThemeData darkMode = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(backgroundColor: Color.fromARGB(255, 42, 11, 71)),
    colorScheme: ColorScheme.dark(
      background: Color.fromARGB(255, 42, 11, 71),
      primary: Colors.white,
      secondary: Colors.blueAccent.shade700,
      primaryContainer: const Color.fromARGB(255, 255, 107, 1),
    ),
  );
}
