import 'package:doeves_app/feauture/main_page/domain/entity/note_with_content/content/content.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_with_content/content/image_content_impl.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_with_content/content/text_content_impl.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_with_content/note_with_content_impl.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class NoteWithContentWidget extends StatelessWidget {
  const NoteWithContentWidget({
    super.key,
    required this.note,
    required this.onPressed,
  });
  final NoteWithContentImpl note;
  final void Function() onPressed;

  Widget get _contentListViewBuilder => ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: note.content.length,
        itemBuilder: (context, index) => _ContentWidget(note.content[index]),
        separatorBuilder: (context, index) => const Divider(height: 25),
      );

  Widget _descriptionBuilder(BuildContext context) => Text(
        note.description,
        style: AppTextTheme.textBase(weight: TextWeight.regular)
            .copyWith(color: Theme.of(context).colorScheme.outline),
      );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      contentPadding: EdgeInsets.zero,
      title: Text(
        note.title,
        style: AppTextTheme.textBase(weight: TextWeight.medium)
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          _descriptionBuilder(context),
          const SizedBox(height: 10),
          _contentListViewBuilder,
        ],
      ),
    );
  }
}

class _ImageContent extends StatelessWidget {
  const _ImageContent(this.imageRef);
  final String imageRef;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Image:',
          style: AppTextTheme.textSm(weight: TextWeight.regular),
        ),
        Container(
          width: 75,
          height: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            imageRef,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class _ContentWidget extends StatelessWidget {
  const _ContentWidget(this.content);
  final Content content;
  @override
  Widget build(BuildContext context) {
    switch (content) {
      case TextContentImpl(:final text):
        {
          return Text(
            text,
            style: AppTextTheme.textSm(weight: TextWeight.regular),
          );
        }
      case ImageContentImpl(:final imageRef):
        {
          return _ImageContent(imageRef);
        }
      default:
        {
          debugPrint('Content builder exception');
          return const SizedBox(height: 0);
        }
    }
  }
}
