import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData.light().copyWith(
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: const Color(0xFFFFFFFF),
    displayColor: const Color(0xFFFFFFFF),
  ),
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFFFFFFFF),
    secondary: Color(0xFFFFFFFF),
  ),
  scaffoldBackgroundColor: const Color(0xFFFF3938),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all(const Color(0xFFFFFFFF)),
    checkColor: MaterialStateProperty.all(const Color(0xFFFF3938)),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(
      color: Color(0xFFFFFFFF),
    ),
    errorStyle: const TextStyle(
      color: Color(0xFFFFFFFF),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xFFFFFFFF),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        width: 2.5,
        color: Color(0xFFFFFFFF),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        width: 2.5,
        color: Color(0xFFFFFFFF),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        width: 2.5,
        color: Color(0xFFFFFFFF),
      ),
    ),
  ),
);
