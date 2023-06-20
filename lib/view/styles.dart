import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  ThemeData lightTheme = ThemeData(
    canvasColor: const Color.fromRGBO(255, 246, 255, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(255, 246, 255, 1),
    hintColor: const Color.fromRGBO(242, 213, 248, 1),
    primaryColor: const Color.fromRGBO(230, 192, 233, 1),
    primaryColorDark: const Color.fromRGBO(67, 45, 73, 1),
    disabledColor: const Color.fromRGBO(141, 137, 166, 1),
    cardColor: const Color.fromRGBO(191, 171, 203, 1),
    shadowColor: const Color.fromRGBO(46, 47, 47, 1),
    splashColor: const Color.fromRGBO(179, 221, 221, 1),
    highlightColor: const Color.fromRGBO(0, 118, 108, 1),
    indicatorColor: const Color.fromRGBO(57, 35, 63, 1),
    textTheme: GoogleFonts.exo2TextTheme(),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: const Color.fromRGBO(0, 118, 108, 1)),
    inputDecorationTheme: const InputDecorationTheme(
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 0.7,
          color: Color.fromRGBO(0, 118, 108, 1),
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 0.5,
          color: Color.fromRGBO(0, 118, 108, 1),
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: Color.fromRGBO(0, 118, 108, 1),
        ),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: Color.fromRGBO(0, 118, 108, 1),
        ),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: Color.fromRGBO(0, 118, 108, 1),
        ),
      ),
    ),
  );

  ThemeData darkTheme = ThemeData(
    canvasColor: const Color.fromRGBO(46, 47, 47, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(46, 47, 47, 1),
    hintColor: const Color.fromRGBO(242, 213, 248, 1),
    primaryColor: const Color.fromRGBO(67, 45, 73, 1),
    primaryColorDark: const Color.fromRGBO(230, 192, 233, 1),
    disabledColor: const Color.fromRGBO(141, 137, 166, 1),
    cardColor: const Color.fromRGBO(191, 171, 203, 1),
    splashColor: const Color.fromRGBO(179, 221, 221, 1),
    highlightColor: const Color.fromRGBO(2, 128, 144, 1),
    dialogBackgroundColor: const Color.fromRGBO(0, 118, 108, 1),
    indicatorColor: const Color.fromRGBO(57, 35, 63, 1),
    textTheme: GoogleFonts.exo2TextTheme(),
    inputDecorationTheme: const InputDecorationTheme(
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 0.7,
          color: Color.fromRGBO(0, 118, 108, 1),
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 0.5,
          color: Color.fromRGBO(0, 118, 108, 1),
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: Color.fromRGBO(0, 118, 108, 1),
        ),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: Color.fromRGBO(0, 118, 108, 1),
        ),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: Color.fromRGBO(0, 118, 108, 1),
        ),
      ),
    ),
  );
}
