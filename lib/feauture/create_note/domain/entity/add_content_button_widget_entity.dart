import 'package:flutter/material.dart';

class AddContentButtonWidgetEntity {
  const AddContentButtonWidgetEntity({
    required this.icon,
    required this.title,
    required this.onPressed,
    this.canPopOnTap = true,
  });
  final String title;
  final IconData icon;
  final void Function() onPressed;
  final bool canPopOnTap;
}
