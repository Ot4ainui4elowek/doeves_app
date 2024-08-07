import 'dart:async';

import 'package:doeves_app/core/data/secure_storage/secure_storage.dart';
import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/notification_service/snack_bar_notification_service/snack_bar_notification_service_impl.dart';
import 'package:doeves_app/feauture/create_note/domain/note_data_transfer_object.dart';
import 'package:doeves_app/feauture/main_page/data/model/note_response_model.dart';
import 'package:doeves_app/feauture/main_page/domain/repository/notes_repository.dart';
import 'package:doeves_app/feauture/main_page/domain/response_bloc/response_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_variables/reactive_variables.dart';

class NotesHomePageViewModel {
  NotesHomePageViewModel({
    required NotesRepository notesRepository,
    required SecureStorage storage,
  })  : _storage = storage,
        _notesRepository = notesRepository;

  final SecureStorage _storage;

  final NotesRepository _notesRepository;

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey();

  late final ScrollController scrollController = ScrollController();

  final isSelectNotesMode = false.rv;

  final Rv<List<int>> selectedNotesList = Rv([]);

  final notificationService = SnackBarNotificationServiceImpl();

  void init() async {
    notesBloc.add(ResponseBlocEvent.loadingNotes());
    await getNotes();

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
    allNotesIsSelected(
        selectedNotesList.length == notes.length && notes.isNotEmpty);
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
    if (!isSelectNotesMode.value &&
        !isLoading.value &&
        scrollController.position.atEdge &&
        scrollController.position.pixels != 0) {
      notesBloc.add(ResponseBlocEvent.loadingNotes());
      getNotes();
    }
  }

  final isLoading = false.rv;

  final Rv<List<NoteResponseModel>> notes = Rv([]);

  final ResponseBloc notesBloc = ResponseBloc();

  Future<void> getNotes() async {
    isLoading(true);

    final jwtToken = await _storage.readToken();
    if (jwtToken == null) {
      return;
    }
    await Future.delayed(const Duration(seconds: 2));
    final result = await _notesRepository.getAllNotes(
        offset: notes.length,
        limit: 10,
        includingCatalogs: false,
        jwtToken: jwtToken);

    isLoading(false);
    notesBloc.add(ResponseBlocEvent.fetchNotes(
        result: result, initialListIsEmpty: notes.isEmpty));
    if (result is GoodUseCaseResult<List<NoteResponseModel>>) {
      final data = result.data;
      notes.addAll(data);
    }
  }

  Future<void> refreshNotes() async {
    notesBloc.add(ResponseBlocEvent.clearState());
    notes.clear();
    await getNotes();
  }

  // Future<void> addNote(
  //     {String description = 'This is added note',
  //     title = 'WTF its work!'}) async {
  //   final result =
  //       await _repository.addNote(description: description, title: title);

  //   switch (result) {
  //     case GoodUseCaseResult<NoteWithContentImpl>(:final data):
  //       {
  //         notes.value.insert(0, data);
  //         notes.refresh();
  //       }
  //     default:
  //       {
  //         debugPrint('bad');
  //       }
  //   }
  // }

  FutureOr<void> onPressedNote(
      {required int index, required BuildContext context}) {
    if (isSelectNotesMode.value) {
      performActionOnNote(
        id: notes[index].id,
        deleteNotesListContainNote:
            checkDelteNotesListContainsNote(notes[index].id),
      );
    } else {
      context.pushNamed(
        AppRoutes.createNotePage,
        extra: OpenNoteTransferObject(
          notes[index].id,
        ),
      );
    }
  }

  Future<void> deleteSomeNotes(BuildContext context) async {
    final jwtToken = await _storage.readToken();
    if (jwtToken == null) {
      return;
    }
    final result = await _notesRepository.deleteMultipleNotes(
      deleteNotesList: selectedNotesList.value,
      jwtToken: jwtToken,
    );
    if (result is GoodUseCaseResult) {
      notes.value
          .removeWhere((note) => selectedNotesList.value.contains(note.id));
      notes.refresh();
      if (notes.isNotEmpty) {
        notesBloc.add(ResponseBlocEvent.clearState());
      } else {
        notesBloc.add(ResponseBlocEvent.resetToInitialState());
      }
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

  Future<void> onNoteDrag(int oldIndex, int newIndex) async {
    return;
    // final oldId = notes.value[oldIndex].id;
    // final newId = notes.value[newIndex].id;

    // if (oldIndex < newIndex) {
    //   newIndex--;
    // }

    // final note = notes.removeAt(oldIndex);

    // notes.value.insert(newIndex, note);

    // final result = await _repository.moveNote(oldId: oldId, newId: newId);

    // switch (result) {
    //   case GoodUseCaseResult<String>(:final data):
    //     {
    //       log(data);
    //     }
    //   case BadUseCaseResult(:final errorList):
    //     {
    //       log(errorList[0].code);
    //     }
    //   default:
    //     {
    //       log('oops!');
    //     }
    // }
  }
}
