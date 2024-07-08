import 'package:doeves_app/feauture/main_page/domain/entity/note_with_content/note_with_content_impl.dart';
import 'package:reactive_variables/reactive_variables.dart';

// [
//     NoteWithContentImpl(
//       title: 'This is first note',
//       description:
//           'This is description, и тут можно писать своё описание заметки',
//       content: [
//         const TextContentImpl('this is macbook'),
//         const TextContentImpl('some text in note'),
//         const ImageContentImpl(
//             'https://xstore.md/images/product/2022/06/Apple-Macbook-Air-M2-Space-Gray-2.jpg'),
//       ],
//     ),
//     NoteWithContentImpl(
//       title: 'This is first note',
//       description:
//           'This is description, и тут можно писать своё описание заметки',
//       content: [
//         const TextContentImpl('this is macbook'),
//         const TextContentImpl('some text in note'),
//       ],
//     ),
//     NoteWithContentImpl(
//       title: 'This is first note',
//       description:
//           'This is description, и тут можно писать своё описание заметки',
//       content: [
//         const TextContentImpl('this is macbook'),
//         const TextContentImpl('some text in note'),
//       ],
//     ),
//     NoteWithContentImpl(
//       title: 'This is first note',
//       description:
//           'This is description, и тут можно писать своё описание заметки',
//       content: [
//         const TextContentImpl('this is macbook'),
//         const TextContentImpl('some text in note'),
//       ],
//     ),
//     NoteWithContentImpl(
//       title: 'This is first note',
//       description:
//           'This is description, и тут можно писать своё описание заметки',
//       content: [
//         const TextContentImpl('this is macbook'),
//         const TextContentImpl('some text in note'),
//       ],
//     ),
//     NoteWithContentImpl(
//       title: 'This is first note',
//       description:
//           'This is description, и тут можно писать своё описание заметки',
//       content: [
//         const TextContentImpl('this is macbook'),
//         const TextContentImpl('some text in note'),
//       ],
//     ),
//     NoteWithContentImpl(
//       title: 'This is first note',
//       description:
//           'This is description, и тут можно писать своё описание заметки',
//       content: [
//         const TextContentImpl('this is macbook'),
//         const TextContentImpl('some text in note'),
//       ],
//     ),
//   ]

class NotesHomePageViewModel {
  final Rv<List<NoteWithContentImpl>> notes = List.generate(
    8,
    (index) => NoteWithContentImpl(
        title: 'title $index', description: 'descr', content: []),
  ).rv;

  void onNoteDrag(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex--;
    }
    final note = notes.removeAt(oldIndex);
    notes.value.insert(newIndex, note);
  }
}
