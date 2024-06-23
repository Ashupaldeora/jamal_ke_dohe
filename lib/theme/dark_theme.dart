import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
    // scaffoldBackgroundColor: Colors.grey.shade900,
    // primary: Colors.grey.shade600,
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: const Color.fromARGB(255, 44, 44, 44),
    ),
    shadowColor: Colors.transparent,
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.poppins(
        textStyle: TextStyle(
            color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),
      ),
      bodyLarge: GoogleFonts.poppins(
        textStyle: TextStyle(
            color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
      ),
      displayLarge: GoogleFonts.poppins(
        textStyle: TextStyle(
            color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),
      ),
    ));
