import 'package:flutter/material.dart';

class ContentWidgetEntity {
  const ContentWidgetEntity({
    required this.icon,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final IconData icon;
  final void Function() onPressed;
}
