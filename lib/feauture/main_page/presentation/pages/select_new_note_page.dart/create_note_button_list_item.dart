import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class CreateNoteButtonListItem extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final void Function() onPressed;
  const CreateNoteButtonListItem(
      {super.key,
      required this.title,
      required this.description,
      required this.icon,
      required this.onPressed});

  Widget iconBuilder(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            width: 2,
          ),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      );
  Widget titleAndDescritpionBuilder(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextTheme.textBase(weight: TextWeight.bold).copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppTextTheme.text2Xs(weight: TextWeight.medium).copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          )
        ],
      );
  BoxDecoration createButtonBoxDecoration(BuildContext context) =>
      BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          width: 2,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          elevation: 0,
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: createButtonBoxDecoration(context),
          child: Row(
            children: [
              iconBuilder(context),
              const SizedBox(width: 14),
              titleAndDescritpionBuilder(context),
            ],
          ),
        ));
  }
}
