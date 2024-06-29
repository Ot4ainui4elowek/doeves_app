import 'package:doeves_app/feauture/select_new_note_page/domain/entity/create_note_entity.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class CreateNoteButtonListItem extends StatelessWidget {
  final CreateNoteEntity createNote;
  const CreateNoteButtonListItem({super.key, required this.createNote});

  Widget _iconBuilder(BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
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
  Widget _titleBuilder(BuildContext context) => Text(
        createNote.title,
        style: AppTextTheme.textBase(weight: TextWeight.bold).copyWith(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      );
  Widget _descritpionBuilder(BuildContext context) => Text(
        createNote.description,
        style: AppTextTheme.text2Xs(weight: TextWeight.medium).copyWith(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      );
  BoxDecoration _createButtonBoxDecoration(BuildContext context) =>
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
    return Container(
      decoration: _createButtonBoxDecoration(context),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        onTap: () => createNote.onPressed(context),
        leading: _iconBuilder(context),
        title: _titleBuilder(context),
        subtitle: _descritpionBuilder(context),
      ),
    );
  }
}
