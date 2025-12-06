import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


final ThemeData appDarkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFFFF9300), // Orange/Gold
    brightness: Brightness.dark,
    primary: Color(0xFFFF9300),
    secondary: Color(0xFFFFD700), // Gold
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
  textTheme: GoogleFonts.interTextTheme().copyWith(
    headlineMedium: GoogleFonts.playfairDisplay(
      color: Color(0xFFFFD700),
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),
    titleLarge: GoogleFonts.playfairDisplay(
      color: Color(0xFFFF9300),
      fontSize: 20,
      fontWeight: FontWeight.semibold,
    ),
    bodyLarge: GoogleFonts.inter(
      color: Color(0xFFF6C757), // Warm gold
      fontSize: 16,
    ),
    bodyMedium: GoogleFonts.inter(
      color: Color(0xFFE6BA91), // Muted gold
      fontSize: 14,
    ),
  ),
  useMaterial3: true,
);
