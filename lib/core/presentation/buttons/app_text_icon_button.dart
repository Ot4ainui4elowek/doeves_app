import 'package:doeves_app/core/presentation/buttons/app_elevated_button.dart';
import 'package:flutter/material.dart';

class AppTextIconButton extends AppElevatedButton {
  AppTextIconButton({
    super.key,
    required this.icon,
    required this.text,
    super.onPressed,
    super.width,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              text,
              const SizedBox(height: 0),
            ],
          ),
        );
  final Widget icon;
  final Widget text;
}
