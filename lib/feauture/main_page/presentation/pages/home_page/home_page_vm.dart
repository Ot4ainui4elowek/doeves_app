import 'dart:async';
import 'dart:developer';

import 'package:doeves_app/core/data/secure_storage/secure_storage.dart';
import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/notification_service/snack_bar_notification_service/snack_bar_notification_service_impl.dart';
import 'package:doeves_app/feauture/create_note/domain/create_note_page_transfer_object.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/notes_list/notes_list_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/remove_list_of_notes/empty_good_response.dart';
import 'package:doeves_app/feauture/main_page/domain/data_transfer_object.dart';
import 'package:doeves_app/feauture/main_page/domain/repository/notes/notes_repository.dart';
import 'package:doeves_app/feauture/main_page/domain/response_bloc/response_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_variables/reactive_variables.dart';

class NotesHomePageViewModel {
  NotesHomePageViewModel({
    required NotesRepository notesRepository,
    required SecureStorage storage,
    DataTransferObject? noteTransferObject,
  })  : _secureStorage = storage,
        _notesRepository = notesRepository,
        _noteTransferObject = noteTransferObject;

  final DataTransferObject? _noteTransferObject;

  final SecureStorage _secureStorage;

  final NotesRepository _notesRepository;

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey();

  late final ScrollController scrollController = ScrollController();

  final isSelectNotesMode = false.rv;

  final Rv<List<int>> selectedNotesList = Rv([]);

  final notificationService = SnackBarNotificationServiceImpl();

  Future<void> init() async {
    if (_noteTransferObject != null) {
      log('transfer object');
    }
    notesBloc.add(ResponseBlocEvent.loading());
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

  void _removeNoteInSelectedNotesList(int id) {
    selectedNotesList.removeWhere((noteId) => id == noteId);
  }

  void _addNoteInSelectedNotesList(int id) {
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
      notesBloc.add(ResponseBlocEvent.loading());
      getNotes();
    }
  }

  final isLoading = false.rv;

  final Rv<List<NoteResponseModel>> notes = Rv([]);

  final ResponseBloc notesBloc = ResponseBloc();

  final includingCatalogs = false.rv;

  Future<void> getNotes() async {
    isLoading(true);

    final jwtToken = await _secureStorage.readToken();
    if (jwtToken == null) {
      return;
    }
    await Future.delayed(const Duration(seconds: 2));
    final result = await _notesRepository.getAllNotes(
        offset: notes.length,
        limit: 10,
        includingCatalogs: includingCatalogs.value,
        jwtToken: jwtToken);

    isLoading(false);
    notesBloc.add(ResponseBlocEvent.fetch(
        result: result, initialListIsEmpty: notes.isEmpty));
    if (result is GoodUseCaseResult<NotesListResponseModel>) {
      final data = result.data.list;
      notes.addAll(data);
    }
  }

  Future<void> refreshNotes() async {
    notesBloc.add(ResponseBlocEvent.loading());
    notes.clear();
    getNotes();
  }

  Future<void> _noteTransferObjectHandler(Object? noteTransferObject) async {
    log(noteTransferObject.toString());
    if (noteTransferObject is DataTransferObject<NoteResponseModel>) {
      switch (noteTransferObject) {
        case DeleteDataTransferObject(:final id):
          {
            log('delete');
            notes.removeWhere(
              (note) => note.id == id,
            );
            notes.refresh();
            break;
          }
        case AddDataTransferObject<NoteResponseModel>(:final data):
          {
            log('add');
            notes.value.insert(0, data);
            notes.refresh();

            break;
          }
        case EditDataTransferObject<NoteResponseModel>(:final editData):
          {
            log('edit');
            final index =
                notes.value.indexWhere((note) => note.id == editData.id);
            if (index == -1) {
              return;
            }
            notes.value[index] = editData;
            notes.refresh();
            break;
          }
      }
    }
  }

  Future<void> addNote(BuildContext context) async {
    _noteTransferObjectHandler(await context.push(AppRoutes.createNotePage));
  }

  FutureOr<void> onPressedNote(
      {required int index, required BuildContext context}) async {
    if (isSelectNotesMode.value) {
      _performActionOnNote(notes[index].id);
    } else {
      _noteTransferObjectHandler(await context.pushNamed(
        AppRoutes.createNotePage,
        extra: OpenNoteTransferObject(
          notes[index].id,
        ),
      ));
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
      notes.value
          .removeWhere((note) => selectedNotesList.value.contains(note.id));
      notes.refresh();
      if (notes.isNotEmpty) {
        notesBloc.add(ResponseBlocEvent.clearState());
      } else {
        notesBloc.add(ResponseBlocEvent.resetToInitialState());
      }
    }
    return result;
  }

  Future<void> deleteNotesOnPressed(BuildContext context) async {
    final result = await _deleteSomeNotes(selectedNotesList.value);
    isSelectNotesMode(false);
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
    final resuestNewIndex = newIndex - 1;

    if (oldIndex < newIndex) {
      newIndex--;
    }

    final oldId = notes.value[oldIndex].id;
    final newId =
        resuestNewIndex == -1 ? null : notes.value[resuestNewIndex].id;

    final note = notes.removeAt(oldIndex);

    notes.value.insert(newIndex, note);
    final result = await _notesRepository.moveNote(
      noteId: oldId,
      prevNoteId: newId,
      jwtToken: jwtToken,
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
