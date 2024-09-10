import 'package:flutter/material.dart';

class WElevatedButtonTheme {
  WElevatedButtonTheme._();

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.grey,
          textStyle: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))));
}
