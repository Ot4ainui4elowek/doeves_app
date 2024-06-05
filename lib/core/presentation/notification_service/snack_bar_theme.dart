import 'package:flutter/material.dart';

class SnackBarTheme {
  final Color textColor;
  final Color backgroundColor;
  SnackBarTheme({required this.backgroundColor, required this.textColor});
  factory SnackBarTheme.seccess() = SuccessSnackBarThemeImpl;
  factory SnackBarTheme.error() = ErrorSnackBarThemeImpl;
}

class SuccessSnackBarThemeImpl implements SnackBarTheme {
  @override
  Color backgroundColor = Colors.green;

  @override
  Color textColor = Colors.white;
}

class ErrorSnackBarThemeImpl implements SnackBarTheme {
  @override
  Color backgroundColor = Colors.red;

  @override
  Color textColor = Colors.white;
}
