import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton(
      {super.key, this.text = 'Back', this.color, this.onPressed, this.style});
  final void Function()? onPressed;
  final String text;
  final Color? color;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? context.pop,
      style: style,
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
            text,
            style: AppTextTheme.textBase(weight: TextWeight.medium).copyWith(
                color: color ?? Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
