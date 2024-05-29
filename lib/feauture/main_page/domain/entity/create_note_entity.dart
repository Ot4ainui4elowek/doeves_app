import 'package:flutter/material.dart';

class CreateNoteEntity {
  final String title;
  final String description;
  final Function(BuildContext context) onPressed;
  final IconData icon;
  const CreateNoteEntity({
    required this.title,
    required this.description,
    required this.onPressed,
    required this.icon,
  });
}
