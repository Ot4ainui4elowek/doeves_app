import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.error_outline,
          color: Theme.of(context).colorScheme.error,
          size: 50,
        ),
        const SizedBox(height: 10),
        Text(
          message,
          textAlign: TextAlign.center,
          style: AppTextTheme.textXl(weight: TextWeight.medium)
              .copyWith(color: Theme.of(context).colorScheme.error),
        ),
      ],
    );
  }
}
