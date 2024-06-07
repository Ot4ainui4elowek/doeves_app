import 'dart:ui';

abstract interface class NotificationTheme {
  final Color textColor;
  final Color backgroundColor;
  NotificationTheme({required this.textColor, required this.backgroundColor});
}
