import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 231, 240, 239),
    elevation: 4,
  ),
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(158, 222, 161, 211),
    secondary: Color.fromARGB(255, 171, 45, 176),
    surface: Color.fromARGB(200, 249, 246, 249),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: const Color.fromARGB(255, 171, 45, 176)),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    labelStyle: const TextStyle(color: Colors.black),
    floatingLabelStyle:
        const TextStyle(color: const Color.fromARGB(255, 171, 45, 176)),
  ),
);
