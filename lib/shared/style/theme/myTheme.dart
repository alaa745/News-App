import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = const Color(0xFF39A552);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
      toolbarHeight: 70,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4F5A69),
      ),
      bodySmall: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    ),
  );
}
