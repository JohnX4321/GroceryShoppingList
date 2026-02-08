import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.green,
      primaryColor: const Color(0xFF2E7D32), // Dark Green
      scaffoldBackgroundColor: const Color(0xFFF1F8E9), // Light Green variation
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87),
        displayMedium: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
        bodyLarge: GoogleFonts.inter(fontSize: 16, color: Colors.black87),
        bodyMedium: GoogleFonts.inter(fontSize: 14, color: Colors.black54),
      ),
      cardTheme: CardThemeData(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF66BB6A),
        foregroundColor: Colors.white,
      ),
    );
  }
}
