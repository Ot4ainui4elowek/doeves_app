import 'package:doeves_app/feauture/main_page/data/model/notes/note_response_model.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class NoteWithContentWidget extends StatelessWidget {
  const NoteWithContentWidget({
    super.key,
    required this.note,
    required this.onPressed,
    this.onLongPress,
  });
  final NoteResponseModel note;
  final void Function()? onPressed;
  final void Function()? onLongPress;

  // Widget get _contentListViewBuilder => ListView.separated(
  //       shrinkWrap: true,
  //       physics: const NeverScrollableScrollPhysics(),
  //       itemCount: note.content.length,
  //       itemBuilder: (context, index) => _ContentWidget(note.content[index]),
  //       separatorBuilder: (context, index) => const Divider(height: 25),
  //     );

  Widget _descriptionBuilder(BuildContext context) =>
      note.description.isNotEmpty
          ? Text(
              note.description,
              style: AppTextTheme.textBase(weight: TextWeight.regular)
                  .copyWith(color: Theme.of(context).colorScheme.outline),
            )
          : const SizedBox(height: 0);

  Widget _titleBuilder(BuildContext context) => note.name.isNotEmpty
      ? Text(
          note.name,
          style: AppTextTheme.textBase(weight: TextWeight.medium)
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        )
      : const SizedBox(height: 0);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      onTap: onPressed,
      contentPadding: EdgeInsets.zero,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleBuilder(context),
          _descriptionBuilder(context),
        ],
      ),
    );
  }
}

// class _ImageContent extends StatelessWidget {
//   const _ImageContent(this.imageRef);
//   final String imageRef;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Image:',
//           style: AppTextTheme.textSm(weight: TextWeight.regular),
//         ),
//         Container(
//           width: 75,
//           height: 50,
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(5)),
//           ),
//           clipBehavior: Clip.antiAlias,
//           child: Image.network(
//             imageRef,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _ContentWidget extends StatelessWidget {
//   const _ContentWidget(this.content);
//   final Content content;
//   @override
//   Widget build(BuildContext context) {
//     switch (content) {
//       case TextContentImpl(:final text):
//         {
//           return Text(
//             text,
//             style: AppTextTheme.textSm(weight: TextWeight.regular),
//           );
//         }
//       case ImageContentImpl(:final imageRef):
//         {
//           return _ImageContent(imageRef);
//         }
//       default:
//         {
//           debugPrint('Content builder exception');
//           return const SizedBox(height: 0);
//         }
//     }
//   }
// }
