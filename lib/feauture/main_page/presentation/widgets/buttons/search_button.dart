import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 14),
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.search),
            Text(
              'Search',
              style: AppTextTheme.textBase(weight: TextWeight.medium),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
