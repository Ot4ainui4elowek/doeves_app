import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/main_page/data/notes_mocked_repository_impl.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_with_content/note_with_content_impl.dart';
import 'package:flutter/material.dart';
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
  NotesHomePageViewModel({required NotesMockedRepositoryImpl repository})
      : _repository = repository;

  late final ScrollController scrollController = ScrollController();
  void init() {
    debugPrint('init');
    scrollController.addListener(checkScroll);
  }

  void dispose() {
    scrollController.removeListener(checkScroll);
  }

  void checkScroll() {
    if (!isLoading.value &&
        scrollController.position.atEdge &&
        scrollController.position.pixels != 0) {
      getNotes();
      debugPrint('yes');
    } else {
      debugPrint('no');
    }
  }

  final isLoading = false.rv;

  final NotesMockedRepositoryImpl _repository;

  final Rv<List<NoteWithContentImpl>> notes = Rv([]);

  Future<void> getNotes() async {
    isLoading(true);
    final result =
        await _repository.getAllNotes(ofest: notes.length, limit: 10);
    isLoading(false);
    switch (result) {
      case GoodUseCaseResult<List<NoteWithContentImpl>>(:final data):
        {
          notes.addAll(data);
        }
      default:
        {
          debugPrint('bad');
        }
    }
  }

  Future<void> addNote(
      {String description = 'This is added note',
      title = 'WTF its work!'}) async {
    final result =
        await _repository.addNote(description: description, title: title);
    switch (result) {
      case GoodUseCaseResult<NoteWithContentImpl>(:final data):
        {
          notes.value.insert(0, data);
          notes.refresh();
        }
      default:
        {
          debugPrint('bad');
        }
    }
  }

  void onNoteDrag(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex--;
    }
    final note = notes.removeAt(oldIndex);
    notes.value.insert(newIndex, note);
  }
}
