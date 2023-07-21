import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(31, 31, 31, 1.0),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
    // useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(31, 31, 31, 1.0),
      elevation: 0,
    ),
    dividerColor: Colors.white24,
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    textTheme: TextTheme(
      bodyMedium: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
      labelSmall: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontWeight: FontWeight.w700,
          fontSize: 14),
    ));
