import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
      primaryColor: const Color.fromARGB(230, 255, 72, 15),
      iconTheme: const IconThemeData(color: Colors.black87),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white,
      unselectedWidgetColor: Colors.black45,
      focusColor: Colors.black,
      textTheme: TextTheme(
        /// main screen
        caption: GoogleFonts.mulish(
          color: Colors.black,
          fontSize: 18,
        ),
        headline1: GoogleFonts.mulish(
            color: Colors.black87, fontSize: 40, fontWeight: FontWeight.w800),
        headline2: GoogleFonts.mulish(
            color: const Color.fromARGB(230, 255, 72, 15),
            fontSize: 14,
            fontWeight: FontWeight.w600),
        headline3: GoogleFonts.mulish(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
        headline4: GoogleFonts.mulish(
          color: Colors.black,
          fontSize: 18,
        ),
        headline5: GoogleFonts.mulish(
          color: Colors.black45,
          fontSize: 14,
        ),
        headline6: GoogleFonts.mulish(
            color: Colors.black87, fontSize: 32, fontWeight: FontWeight.w800),
        subtitle1: GoogleFonts.mulish(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        hoverColor: Colors.white,
        splashColor: Colors.white,
        backgroundColor: Colors.grey.shade200,
      ),
      colorScheme: ColorScheme.light(
        primary: Colors.grey.shade200,
        // ignore: deprecated_member_use
        primaryVariant: Colors.grey.shade300,
        secondary: Colors.grey.shade100,
      ),
      cardTheme: const CardTheme(
        color: Color(0xFFf7f7f9),
        shadowColor: Colors.black12,
        surfaceTintColor: Colors.white,
      ));

  static final ThemeData dark = ThemeData(
      primaryColor: const Color.fromARGB(230, 255, 72, 15),
      cardColor: Colors.white24,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.white70),
      appBarTheme: const AppBarTheme(
        color: Colors.black,
      ),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      focusColor: Colors.white,
      textTheme: TextTheme(
        /// main screen
        caption: GoogleFonts.mulish(
          color: Colors.white,
          fontSize: 18,
        ),
        headline1: GoogleFonts.mulish(
            color: Colors.white70, fontSize: 24, fontWeight: FontWeight.w800),
        headline2: GoogleFonts.mulish(
            color: const Color.fromARGB(230, 255, 72, 15),
            fontSize: 14,
            fontWeight: FontWeight.w600),
        headline3: GoogleFonts.mulish(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
        headline4: GoogleFonts.mulish(
          color: Colors.white,
          fontSize: 18,
        ),
        headline5: GoogleFonts.mulish(
          color: Colors.white54,
          fontSize: 14,
        ),
        headline6: GoogleFonts.mulish(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800),
        subtitle1: GoogleFonts.mulish(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        hoverColor: Colors.black,
        splashColor: Colors.black,
        backgroundColor: Colors.white24,
      ),
      cardTheme: const CardTheme(
        color: Color(0xFF3d3d3d),
        shadowColor: Colors.white12,
        surfaceTintColor: Colors.white24,
      ));
}
