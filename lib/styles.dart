import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  ThemeData lightTheme = ThemeData(
    canvasColor: Color.fromRGBO(255, 246, 255, 1),
    scaffoldBackgroundColor: Color.fromRGBO(255, 246, 255, 1),
    hintColor: Color.fromRGBO(242, 213, 248, 1),
    primaryColor: Color.fromRGBO(230, 192, 233, 1),
    primaryColorDark: Color.fromRGBO(67, 45, 73, 1),
    disabledColor: Color.fromRGBO(141, 137, 166, 1),
    cardColor: Color.fromRGBO(191, 171, 203, 1),
    shadowColor: Color.fromRGBO(46, 47, 47, 1),
    splashColor: Color.fromRGBO(179, 221, 221, 1),
    highlightColor: Color.fromRGBO(0, 118, 108, 1),
    indicatorColor: Color.fromRGBO(57, 35, 63, 1),
    textTheme: GoogleFonts.exo2TextTheme(),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: Color.fromRGBO(0, 118, 108, 1)),
  );

  ThemeData darkTheme = ThemeData(
    canvasColor: Color.fromRGBO(46, 47, 47, 1),
    scaffoldBackgroundColor: Color.fromRGBO(46, 47, 47, 1),
    hintColor: Color.fromRGBO(242, 213, 248, 1),
    primaryColor: Color.fromRGBO(67, 45, 73, 1),
    primaryColorDark: Color.fromRGBO(230, 192, 233, 1),
    disabledColor: Color.fromRGBO(141, 137, 166, 1),
    cardColor: Color.fromRGBO(191, 171, 203, 1),
    splashColor: Color.fromRGBO(179, 221, 221, 1),
    highlightColor: Color.fromRGBO(2, 128, 144, 1),
    dialogBackgroundColor: Color.fromRGBO(0, 118, 108, 1),
    indicatorColor: Color.fromRGBO(57, 35, 63, 1),
    textTheme: GoogleFonts.exo2TextTheme(),
  );
}
