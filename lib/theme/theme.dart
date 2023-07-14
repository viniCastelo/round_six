import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundSixTheme {
  static MaterialColor color = const MaterialColor(
    0xFFFB217F,
    {
      50: Color(0xFFFEC8DF),
      100: Color(0xFFFDA6CC),
      200: Color(0xFFFD85B9),
      300: Color(0xFFFC64A5),
      400: Color(0xFFFC4292),
      500: Color(0xFFFB217F),
      600: Color(0xFFD51C6C),
      700: Color(0xFFB01759),
      800: Color(0xFF8A1246),
      900: Color(0xFF640D33),
    },
  );

  static MaterialColor background = const MaterialColor(
    0xFF1F1F1F,
    {
      50: Color(0xFFC7C7C7),
      100: Color(0xFFA5A5A5),
      200: Color(0xFF848484),
      300: Color(0xFF626262),
      400: Color(0xFF414141),
      500: Color(0xFF1F1F1F),
      600: Color(0xFF1A1A1A),
      700: Color(0xFF161616),
      800: Color(0xFF111111),
      900: Color(0xFF0C0C0C),
    },
  );

  static ButtonStyle outlineButtontyle({
    Color color = Colors.white,
    double padding = 24.0,
  }) {
    return OutlinedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: padding),
      side: BorderSide(color: color),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }

  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    primarySwatch: color,
    primaryColor: color,
    textTheme: GoogleFonts.wendyOneTextTheme(
      ThemeData.dark().textTheme,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: outlineButtontyle(),
    ),
    appBarTheme: ThemeData.dark().appBarTheme.copyWith(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: GoogleFonts.wendyOne(fontSize: 25),
          centerTitle: true,
        ),
  );
}
