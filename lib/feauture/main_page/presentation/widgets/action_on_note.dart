import 'dart:async';

import 'package:doeves_app/core/presentation/buttons/app_elevated_button.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class ActionOnNoteButton extends StatelessWidget {
  const ActionOnNoteButton({
    super.key,
    required this.icon,
    required this.actionText,
    this.onPressed,
  });
  final IconData icon;
  final String actionText;
  final FutureOr<void> Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppElevatedButton(
            mini: true,
            style: ButtonStyle(
              side: WidgetStatePropertyAll(
                BorderSide(
                  color: onPressed == null
                      ? Theme.of(context).colorScheme.outline
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            onPressed: onPressed,
            child: Icon(icon),
          ),
          const SizedBox(height: 5),
          Text(
            actionText,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: AppTextTheme.textSm(weight: TextWeight.regular).copyWith(
              color: onPressed == null
                  ? Theme.of(context).colorScheme.outline
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
