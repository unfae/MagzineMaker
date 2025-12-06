import 'package:flutter/material.dart';

final ThemeData appDarkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFFFF9300), // Orange/Gold
    brightness: Brightness.dark,
    primary: Color(0xFFFF9300),
    secondary: Color(0xFFFFD700), // Gold
    background: Color(0xFF141110),
    surface: Color(0xFF241C17),
    onPrimary: Colors.black87,
    onSecondary: Colors.black87,
  ),
  scaffoldBackgroundColor: Color(0xFF141110),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1C1307),
    foregroundColor: Color(0xFFFFD700),
    elevation: 0,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFF9300),
    foregroundColor: Colors.black,
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      color: Color(0xFFFFD700),
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),
    titleLarge: TextStyle(
      color: Color(0xFFFF9300),
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: TextStyle(
      color: Color(0xFFF6C757), // Warm gold
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: Color(0xFFE6BA91), // Muted gold
      fontSize: 14,
    ),
  ),
  fontFamily: 'Arial',
  useMaterial3: true,
);
