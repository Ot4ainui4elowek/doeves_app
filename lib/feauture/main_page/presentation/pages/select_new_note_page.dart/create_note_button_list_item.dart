import 'package:doeves_app/feauture/main_page/domain/entity/create_note_entity.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class CreateNoteButtonListItem extends StatelessWidget {
  final CreateNoteEntity createNote;
  const CreateNoteButtonListItem({super.key, required this.createNote});

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
          createNote.icon,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      );
  Widget titleAndDescritpionBuilder(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            createNote.title,
            style: AppTextTheme.textBase(weight: TextWeight.bold).copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            createNote.description,
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
        onPressed: () => createNote.onPressed(context),
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
