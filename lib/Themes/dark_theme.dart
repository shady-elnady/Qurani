import 'package:flutter/material.dart';

import '../App/Assets/fonts.dart';

final ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  fontFamily: AppFonts.quran,
  // Text Theme
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    ),
  ),
  //
);
