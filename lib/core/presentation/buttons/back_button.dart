import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.text, this.color});
  final String? text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: TextButton(
        onPressed: context.pop,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 15,
              color: color ?? Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 7),
            Text(
              'Back',
              style: AppTextTheme.textBase(weight: TextWeight.medium).copyWith(
                  color: color ?? Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
