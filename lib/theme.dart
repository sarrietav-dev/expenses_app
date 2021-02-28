import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
      primarySwatch: Colors.purple,
      accentColor: Colors.amber,
      fontFamily: "Quicksand",
      textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
              fontFamily: "OpenSans",
              fontWeight: FontWeight.bold,
              fontSize: 18),
          button: TextStyle(color: Colors.white)),
      appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )));
}
