import 'package:flutter/material.dart';

enum Role { TANKER, FIGHTER, MARKSMAN, MAGE, ASSASIN }

enum Difficulty { LOW, MODERATE, HIGH }

final backgoundColor = Color(0xff000913);
final appbarColor = Color(0xff112120);

final difficultyEnableColor = Color(0xff08d6f6);
final difficultyDisableColor = Color(0xff023240);

const textTheme = TextTheme(
  titleLarge: TextStyle(
      fontSize: 60.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontStyle: FontStyle.italic,
      letterSpacing: 4.0),
  titleMedium: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      letterSpacing: 1.0),
  titleSmall: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      letterSpacing: 1.0),
  bodyLarge: TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      letterSpacing: 1.0),
);
