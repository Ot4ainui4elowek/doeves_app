import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/main_page/data/repository/notes_mocked_repository_impl.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_with_content/note_with_content_impl.dart';
import 'package:doeves_app/feauture/main_page/domain/notes/notes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class NotesHomePageViewModel {
  NotesHomePageViewModel({required NotesMockedRepositoryImpl repository})
      : _repository = repository;

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey();

  late final ScrollController scrollController = ScrollController();
  void init() async {
    debugPrint('init');
    notesBloc.add(NotesEvent.loadingNotes());
    await getNotes();
    notesBloc.add(NotesEvent.clearState());
    scrollController.addListener(checkScroll);
  }

  void dispose() {
    scrollController.removeListener(checkScroll);
  }

  void checkScroll() {
    if (!isLoading.value &&
        scrollController.position.atEdge &&
        scrollController.position.pixels != 0) {
      notesBloc.add(NotesEvent.loadingNotes());
      getNotes();
    }
  }

  final isLoading = false.rv;

  final NotesMockedRepositoryImpl _repository;

  final Rv<List<NoteWithContentImpl>> notes = Rv([]);

  final NotesBloc notesBloc = NotesBloc();

  Future<void> getNotes() async {
    isLoading(true);

    final result =
        await _repository.getAllNotes(ofest: notes.length, limit: 10);

    notesBloc.add(NotesEvent.fetchNotes(result: result));

    isLoading(false);

    if (result is GoodUseCaseResult<List<NoteWithContentImpl>>) {
      notes.addAll(result.data);
    }
  }

  Future<void> refreshNotes() async {
    notesBloc.add(NotesEvent.clearState());
    notes.clear();
    await getNotes();
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

  bool isTouchDevice(BuildContext context) {
    final platform = Theme.of(context).platform;
    return platform == TargetPlatform.android ||
        platform == TargetPlatform.iOS ||
        platform == TargetPlatform.fuchsia;
  }

  void onNoteDrag(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex--;
    }

    final note = notes.removeAt(oldIndex);

    notes.value.insert(newIndex, note);
  }
}
