import 'package:flutter/material.dart';

class Styles {
  static ThemeData appTheme({required BuildContext context}) {
    return ThemeData(
        useMaterial3: false,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
        indicatorColor: const Color(0xffCBDCF8),
        hintColor: const Color(0xffEECED3),
        highlightColor: Colors.black.withOpacity(0.2),
        hoverColor: const Color(0xff4285F4),
        focusColor: const Color(0xffA8DAB5),
        disabledColor: const Color(0xFFAFAFAF),
        cardColor: Colors.white,
        canvasColor: Colors.grey[50],
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: const ColorScheme.light()),
        appBarTheme: null,
        fontFamily: 'ProductSans',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 28, color: Colors.black),
          displayLarge: TextStyle(fontSize: 24, color: Colors.black),
          displayMedium: TextStyle(fontSize: 22, color: Color(0xFF215B85), fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontSize: 20, color: Colors.black),
          headlineMedium: TextStyle(fontSize: 18, color: Color(0xFF215B85), fontWeight: FontWeight.w600),
          headlineSmall: TextStyle(fontSize: 16, color: Color(0xFF215B85), fontWeight: FontWeight.w600),
          titleLarge: TextStyle(fontSize: 14, color: Colors.black),
          titleMedium: TextStyle(fontSize: 12, color: Colors.black),
          titleSmall: TextStyle(fontSize: 11, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 10, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 10, color: Colors.black),
          bodySmall: TextStyle(fontSize: 9, color: Colors.black),
        ),
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFF01A6AB),
            primaryContainer: Color(0xFF484848),
            secondary: Color(0xFF21845f),
            secondaryContainer: Color(0xFF000000),
            onError: Color(0xFFF52626),
            error: Color(0xFFc41d1d),
            onSurface: Color(0xFFEDEDED),
            onSecondary: Color(0xFFFF8800),
            onPrimary: Color(0xFF215B85),
            surface: Colors.white).copyWith(surface: const Color(0xffF1F5FB)));
  }
}