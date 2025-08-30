import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightBeige = Color(0xFFF5E9DA);
  static const Color mediumBrown = Color(0xFF8D6748);
  static const Color darkBrown = Color(0xFF5D4037);
  static const Color lightBrown = Color(0xFFD7CCC8);

  static final ThemeData brownTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: mediumBrown,
      brightness: Brightness.light,
      primary: mediumBrown,
      secondary: darkBrown,
      background: lightBeige,
      surface: lightBeige,
    ),
    scaffoldBackgroundColor: lightBeige,
    appBarTheme: const AppBarTheme(
      backgroundColor: mediumBrown,
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: darkBrown,
        fontWeight: FontWeight.bold,
        fontSize: 28,
        letterSpacing: 1.2,
      ),
      bodyMedium: TextStyle(
        color: darkBrown,
        fontSize: 16,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightBrown,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide.none,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: mediumBrown,
      foregroundColor: Colors.white,
    ),
  );
}