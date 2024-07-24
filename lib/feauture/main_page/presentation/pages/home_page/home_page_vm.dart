import 'dart:developer';

import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/notification_service/snack_bar_notification_service/snack_bar_notification_service_impl.dart';
import 'package:doeves_app/feauture/main_page/data/repository/notes_mocked_repository_impl.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_with_content/note_with_content_impl.dart';
import 'package:doeves_app/feauture/main_page/domain/notes/notes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_variables/reactive_variables.dart';

class NotesHomePageViewModel {
  NotesHomePageViewModel({required NotesMockedRepositoryImpl repository})
      : _repository = repository;

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey();

  late final ScrollController scrollController = ScrollController();

  final isSelectNotesMode = false.rv;

  final Rv<List<int>> selectedNotesList = Rv([]);

  final notificationService = SnackBarNotificationServiceImpl();

  void init() async {
    notesBloc.add(NotesEvent.loadingNotes());
    await getNotes();
    notesBloc.add(NotesEvent.clearState());
    scrollController.addListener(checkScroll);
    isSelectNotesMode.addListener(
      () {
        if (!isSelectNotesMode.value) {
          selectedNotesList.clear();
        }
      },
    );
    notes.addListener(_checkAllNotesIsSelected);
    selectedNotesList.addListener(_checkAllNotesIsSelected);
  }

  void dispose() {
    scrollController.removeListener(checkScroll);
    notes.removeListener(_checkAllNotesIsSelected);
    selectedNotesList.removeListener(_checkAllNotesIsSelected);
  }

  bool checkDelteNotesListContainsNote(int id) {
    return selectedNotesList.value.contains(id);
  }

  void _removeNoteInDeleteNotesList(int id) {
    selectedNotesList.removeWhere((noteId) => id == noteId);
  }

  void _addNoteInDeleteNotesList(int id) {
    selectedNotesList.add(id);
  }

  void _checkAllNotesIsSelected() {
    allNotesIsSelected(selectedNotesList.length == notes.length);
  }

  final allNotesIsSelected = false.rv;

  void onPressedSelectAllNotes() {
    if (allNotesIsSelected.value) {
      _unselectAllNotes();
    } else {
      _selectAllNotes();
    }
  }

  void _unselectAllNotes() {
    selectedNotesList.clear();
  }

  void _selectAllNotes() {
    if (selectedNotesList.isNotEmpty) {
      selectedNotesList.clear();
    }
    selectedNotesList.addAll(notes.value.map((note) => note.id));
  }

  void performActionOnNote(
      {required bool deleteNotesListContainNote, required int id}) {
    deleteNotesListContainNote
        ? _removeNoteInDeleteNotesList(id)
        : _addNoteInDeleteNotesList(id);
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

  Future<void> deleteSomeNotes(BuildContext context) async {
    final result =
        await _repository.deleteMoreNotes(deletedList: selectedNotesList.value);
    if (result is GoodUseCaseResult) {
      notes.value
          .removeWhere((note) => selectedNotesList.value.contains(note.id));
      notes.refresh();
    }
    isSelectNotesMode(false);
    if (context.mounted && context.canPop()) {
      notificationService.responseNotification(
        response: result,
        context: context,
        goodUseCaseMessage: 'Notes have been deleted',
      );
      context.pop();
    }
  }

  bool isTouchDevice(BuildContext context) {
    final platform = Theme.of(context).platform;
    return platform == TargetPlatform.android ||
        platform == TargetPlatform.iOS ||
        platform == TargetPlatform.fuchsia;
  }

  Future<void> onNoteDrag(int oldIndex, int newIndex) async {
    final oldId = notes.value[oldIndex].id;
    final newId = notes.value[newIndex].id;

    if (oldIndex < newIndex) {
      newIndex--;
    }

    final note = notes.removeAt(oldIndex);

    notes.value.insert(newIndex, note);

    final result = await _repository.moveNote(oldId: oldId, newId: newId);

    switch (result) {
      case GoodUseCaseResult<String>(:final data):
        {
          log(data);
        }
      case BadUseCaseResult(:final errorList):
        {
          log(errorList[0].code);
        }
      default:
        {
          log('oops!');
        }
    }
  }
}
