import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
    colorScheme:
        ColorScheme.light(background: Color(0xffF4F3F3), primary: Colors.white),
    shadowColor: Colors.black12,
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.poppins(
        textStyle: TextStyle(
            color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
      ),
      bodyLarge: GoogleFonts.poppins(
        textStyle: TextStyle(
            color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
      ),
      displayLarge: GoogleFonts.poppins(
        textStyle: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    ));
