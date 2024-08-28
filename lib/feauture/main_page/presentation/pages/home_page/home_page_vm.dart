import 'dart:async';
import 'dart:developer';

import 'package:doeves_app/core/data/secure_storage/secure_storage.dart';
import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/blocs/list_response_bloc/list_response_bloc.dart';
import 'package:doeves_app/core/domain/data_transfer/data_transfer_handler.dart';
import 'package:doeves_app/core/domain/data_transfer/data_transfer_object.dart';
import 'package:doeves_app/core/domain/mixins/reorderable_list_mixin.dart';
import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/notification_service/snack_bar_notification_service/snack_bar_notification_service_impl.dart';
import 'package:doeves_app/feauture/create_note/domain/create_note_data_transfer_object.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/notes_list/notes_list_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/remove_list_of_notes/empty_good_response.dart';
import 'package:doeves_app/feauture/main_page/domain/repository/notes/notes_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_variables/reactive_variables.dart';

class NotesHomePageViewModel with DataTransferHandler, ReorderableListMixin {
  NotesHomePageViewModel({
    required NotesRepository notesRepository,
    required SecureStorage storage,
  })  : _secureStorage = storage,
        _notesRepository = notesRepository;

  final SecureStorage _secureStorage;

  final NotesRepository _notesRepository;

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey();

  late final ScrollController scrollController = ScrollController();

  final isSelectNotesMode = false.rv;

  final Rv<List<int>> selectedNotesList = Rv([]);

  final notificationService = SnackBarNotificationServiceImpl();

  Future<void> init() async {
    await getNotes();

    scrollController.addListener(checkScroll);
    isSelectNotesMode.addListener(
      () {
        if (!isSelectNotesMode.value) {
          selectedNotesList.clear();
        }
      },
    );
    notesList.addListener(_checkAllNotesIsSelected);
    selectedNotesList.addListener(_checkAllNotesIsSelected);
  }

  void dispose() {
    scrollController.removeListener(checkScroll);
    notesList.removeListener(_checkAllNotesIsSelected);
    selectedNotesList.removeListener(_checkAllNotesIsSelected);
  }

  bool checkDelteNotesListContainsNote(int id) {
    return selectedNotesList.value.contains(id);
  }

  void _removeNoteInSelectedNotesList(int id) {
    selectedNotesList.removeWhere((noteId) => id == noteId);
  }

  void _addNoteInSelectedNotesList(int id) {
    selectedNotesList.add(id);
  }

  void _checkAllNotesIsSelected() {
    allNotesIsSelected(
        selectedNotesList.length == notesList.length && notesList.isNotEmpty);
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
    selectedNotesList.addAll(notesList.value.map((note) => note.id));
  }

  void _performActionOnNote(int id) {
    checkDelteNotesListContainsNote(id)
        ? _removeNoteInSelectedNotesList(id)
        : _addNoteInSelectedNotesList(id);
  }

  void checkScroll() {
    if (!isSelectNotesMode.value &&
        !isLoading.value &&
        scrollController.position.atEdge &&
        scrollController.position.pixels != 0) {
      notesBloc.add(ListResponseBlocEvent.loading());
      getNotes();
    }
  }

  final isLoading = false.rv;

  final Rv<List<NoteResponseModel>> notesList = Rv([]);

  final ListResponseBloc notesBloc = ListResponseBloc();

  final includingCatalogs = false.rv;

  Future<void> getNotes() async {
    log('get notes');
    isLoading(true);

    final jwtToken = await _secureStorage.readToken();
    if (jwtToken == null) {
      return;
    }
    notesBloc.add(ListResponseBlocEvent.loading());
    final result = await _notesRepository.getAllNotes(
        offset: notesList.length,
        limit: 10,
        includingCatalogs: includingCatalogs.value,
        jwtToken: jwtToken);

    isLoading(false);
    notesBloc.add(ListResponseBlocEvent.fetch(
        result: result, initialListIsEmpty: notesList.isEmpty));
    if (result is GoodUseCaseResult<NotesListResponseModel>) {
      final data = result.data.list;
      notesList.addAll(data);
    }
  }

  Future<void> refreshNotes() async {
    notesList.clear();
    getNotes();
  }

  Future<void> addNote(BuildContext context) async {
    _goToCreateNotePage(await context.push(AppRoutes.createNotePage));
  }

  FutureOr<void> onPressedNote(
      {required int index, required BuildContext context}) async {
    if (isSelectNotesMode.value) {
      _performActionOnNote(notesList[index].id);
    } else {
      _openNote(context: context, index: index);
    }
  }

  Future<void> _openNote(
      {required BuildContext context, required int index}) async {
    _goToCreateNotePage(
      await context.push(
        AppRoutes.createNotePage,
        extra: OpenNoteTransferObject(
          notesList[index].id,
        ),
      ),
    );
  }

  void _goToCreateNotePage(DataTransferObject<NoteResponseModel>? data) {
    requestToPage<NoteResponseModel>(
      data: data,
      create: (data) {
        log('add');
        notesList.value.insert(0, data);
        notesList.refresh();
      },
      edit: (editedData) {
        log('edit');
        final index =
            notesList.value.indexWhere((note) => note.id == editedData.id);
        if (index == -1) {
          return;
        }
        notesList.value[index] = editedData;
        notesList.refresh();
      },
      delete: (deletedData) {
        log('delete ${deletedData.id}');
        notesList.removeWhere(
          (note) => note.id == deletedData.id,
        );
        notesList.refresh();
      },
    );
    if (notesList.isEmpty) {
      notesBloc.add(ListResponseBlocEvent.resetToInitialState());
    } else {
      notesBloc.add(ListResponseBlocEvent.clearState());
    }
  }

  Future<UseCaseResult> _deleteSomeNotes(List<int> idList) async {
    final jwtToken = await _secureStorage.readToken();
    if (jwtToken == null) {
      return BadUseCaseResult(errorList: [SpecificError('undefined jwt')]);
    }
    final result = await _notesRepository.deleteMultipleNotes(
      deleteNotesList: idList,
      jwtToken: jwtToken,
    );
    if (result is GoodUseCaseResult) {
      notesList.value
          .removeWhere((note) => selectedNotesList.value.contains(note.id));
      notesList.refresh();
      if (notesList.isNotEmpty) {
        notesBloc.add(ListResponseBlocEvent.clearState());
      } else {
        notesBloc.add(ListResponseBlocEvent.resetToInitialState());
      }
    }
    return result;
  }

  Future<void> deleteNotesOnPressed(BuildContext context) async {
    final result = await _deleteSomeNotes(selectedNotesList.value);
    isSelectNotesMode(false);
    if (result is GoodUseCaseResult && notesList.isEmpty) {
      await getNotes();
    }
    if (context.mounted && context.canPop()) {
      notificationService.responseNotification(
        result: result,
        context: context,
        goodUseCaseMessage: 'Notes have been deleted',
      );

      context.pop();
    }
  }

  void onPressedSelectionModeButton() {
    if (isSelectNotesMode.value) {
      selectedNotesList.clear();
    }
    isSelectNotesMode(!isSelectNotesMode.value);
  }

  Future<void> onNoteDrag(int oldIndex, int newIndex) async {
    final jwtToken = await _secureStorage.readToken();
    if (jwtToken == null) {
      return;
    }

    final result = await onReorder(
      callBack: (oldIndex, newIndex) async => await _notesRepository.moveNote(
        noteId: oldIndex,
        prevNoteId: newIndex,
        jwtToken: jwtToken,
      ),
      list: notesList,
      newIndex: newIndex,
      oldIndex: oldIndex,
    );

    switch (result) {
      case GoodUseCaseResult<EmptyGoodResponse>():
        {
          log('successfull');
        }
      case BadUseCaseResult<EmptyGoodResponse>(:final errorList):
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
