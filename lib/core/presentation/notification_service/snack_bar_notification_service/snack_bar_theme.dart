import 'package:doeves_app/core/presentation/notification_service/notification_theme.dart';
import 'package:flutter/material.dart';

class SnackBarThemeImpl implements NotificationTheme {
  @override
  final Color textColor;

  @override
  final Color backgroundColor;

  SnackBarThemeImpl({required this.backgroundColor, required this.textColor});

  factory SnackBarThemeImpl.seccess() = SuccessSnackBarThemeImpl;
  factory SnackBarThemeImpl.error() = ErrorSnackBarThemeImpl;
}

class SuccessSnackBarThemeImpl implements SnackBarThemeImpl {
  @override
  Color backgroundColor = Colors.green;

  @override
  Color textColor = Colors.white;
}

class ErrorSnackBarThemeImpl implements SnackBarThemeImpl {
  @override
  Color backgroundColor = Colors.red;

  @override
  Color textColor = Colors.white;
}
