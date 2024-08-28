import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key, required this.count, this.style});
  final int count;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 44,
      constraints: const BoxConstraints(
        minWidth: 44,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(22)),
      child: Center(
        child: Text(
          count.toString(),
          style: style ??
              AppTextTheme.textBase(
                weight: TextWeight.medium,
              ),
        ),
      ),
    );
  }
}
