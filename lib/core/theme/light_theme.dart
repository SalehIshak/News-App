import 'package:flutter/material.dart';

class LightTheme {
  // 🎨 Main Colors
  static const Color primaryColor = Color(0xFFC53030);
  static const Color secondaryColor = Color(0xFFFFFCFC);
  static const Color lightBackgroundColor = Color(0xFFF5F7FA);
  static const Color darkBackgroundColor = Color(0xFF121212);

  // 🌞 Light Theme
  static ThemeData lightTheme = ThemeData(
    // useMaterial3: true,
    // brightness: Brightness.light,
    // primaryColor: primaryColor,
    scaffoldBackgroundColor: lightBackgroundColor,

    // colorScheme: const ColorScheme.light(
    //    primary: primaryColor,
    //    secondary: secondaryColor,
    // ),
    appBarTheme: const AppBarTheme(
      backgroundColor: lightBackgroundColor,
      foregroundColor: darkBackgroundColor,
      titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: darkBackgroundColor),
      // elevation: 0,
      // centerTitle: true,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.zero),
        textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: Colors.white,
    //   border: OutlineInputBorder(
    //     borderSide: const BorderSide(color: Colors.grey),
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderSide: const BorderSide(color: Colors.grey),
    //   ),
    // ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 14),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightBackgroundColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
      unselectedItemColor: darkBackgroundColor,
    ),
  );
}
