import 'package:doeves_app/core/presentation/text_fields/app_text_field.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/password_text_editing_controller.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final ValueNotifier<bool> _textIsInvisible = ValueNotifier<bool>(true);

  final PasswordTextEditingController controller;

  void _setPasswordISVisible() =>
      _textIsInvisible.value = !_textIsInvisible.value;

  final String? labelText;
  final String? hintText;

  PasswordTextField(
      {super.key, this.labelText, required this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _textIsInvisible,
      builder: (context, value, child) => AppTextField(
        hintText: hintText,
        controller: controller,
        obscureText: _textIsInvisible.value,
        labelText: labelText,
        suffixIcon: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          icon: const Icon(Icons.remove_red_eye_outlined),
          onPressed: _setPasswordISVisible,
        ),
      ),
    );
  }
}
