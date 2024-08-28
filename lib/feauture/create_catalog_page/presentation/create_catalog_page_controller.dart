import 'dart:developer';

import 'package:doeves_app/core/data/secure_storage/secure_storage.dart';
import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/blocs/list_response_bloc/list_response_bloc.dart';
import 'package:doeves_app/core/domain/data_transfer/data_transfer_handler.dart';
import 'package:doeves_app/core/domain/data_transfer/data_transfer_object.dart';
import 'package:doeves_app/core/domain/router/app_router.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/notification_service/snack_bar_notification_service/snack_bar_notification_service_impl.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/feauture/authorization/data/model/http_status_and_errors.dart';
import 'package:doeves_app/feauture/create_catalog_page/domain/create_catalog_respository.dart';
import 'package:doeves_app/feauture/create_note/domain/create_note_data_transfer_object.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalog_request_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/create_note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/notes_list/notes_list_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/remove_list_of_notes/empty_good_response.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class CreateCatalogPageController with DataTransferHandler {
  CreateCatalogPageController({
    required CreateCatalogRepository catalogRepository,
    required SecureStorage secureStorage,
  })  : _secureStorage = secureStorage,
        _catalogRepository = catalogRepository;

  final _notificationService = SnackBarNotificationServiceImpl();

  final scrollController = ScrollController();

  final allNotesIsSelected = false.rv;

  final notesBloc = ListResponseBloc();

  final Rv<List<int>> selectedList = Rv([]);

  final isLoading = false.rv;

  final catalogId = Rv(-1);

  final SecureStorage _secureStorage;

  final catalognameController = AppTextEditingController();

  final CreateCatalogRepository _catalogRepository;

  final Rv<List<NoteResponseModel>> notesList = Rv([]);

  final isSelectedMode = false.rv;

  void onPressedNote(
      {required NoteResponseModel note, required BuildContext context}) {
    if (isSelectedMode.value) {
      _onPressedNoteIsSelectedMode(note);
    } else {
      openNote(context: context, note: note);
    }
  }

  Future<void> openNote(
      {required NoteResponseModel note, required BuildContext context}) async {
    final result = await showDialog(
      context: context,
      builder: (context) => AppRouter.createNotePage(
          data: CreateNoteDataTransferObject.openNote(
        note.id,
      )),
    );
    _goToCreateNotePage(result);
  }

  Future<void> createNote(
      {required int id, required BuildContext context}) async {
    log(id.toString());
    final result = await showDialog(
      context: context,
      builder: (context) => AppRouter.createNotePage(
          data: CreateNoteDataTransferObject.newNote(id)),
    );
    _goToCreateNotePage(result);
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

  void _onPressedNoteIsSelectedMode(NoteResponseModel note) {
    if (selectedList.value.contains(note.id)) {
      selectedList.remove(note.id);
    } else {
      selectedList.add(note.id);
    }
  }

  Future<UseCaseResult<EmptyGoodResponse>> editCatalogName(int id) async {
    final jwtToken = await _secureStorage.readToken();

    if (jwtToken == null) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.undefinedJWTToken.name)]);
    }

    return await _catalogRepository.editCatalogName(
        jwtToken: jwtToken,
        id: id,
        catalogName: catalognameController.text.trim());
  }

  Future<UseCaseResult<IdResponseModel>> createCatalog() async {
    final jwtToken = await _secureStorage.readToken();

    isLoading(true);

    notesBloc.add(ListResponseBlocEvent.loading());

    if (jwtToken == null) {
      notesBloc.add(ListResponseBlocEvent.error(
          HttpStatusAndErrors.undefinedJWTToken.name));

      isLoading(false);

      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.undefinedJWTToken.name)]);
    }

    final result = await _catalogRepository.createCatalog(
        newCatalog: CatalogRequestModel(''), jwtToken: jwtToken);
    notesBloc.add(ListResponseBlocEvent.error(
        HttpStatusAndErrors.undefinedJWTToken.name));
    notesBloc.add(ListResponseBlocEvent.resetToInitialState());
    isLoading(false);

    return result;
  }

  Future<void> getNotes(int id) async {
    final jwtToken = await _secureStorage.readToken();

    isLoading(true);
    notesBloc.add(ListResponseBlocEvent.loading());
    if (jwtToken == null) {
      notesBloc.add(ListResponseBlocEvent.error(
          HttpStatusAndErrors.undefinedJWTToken.name));
      isLoading(false);
      return;
    }
    final result = await _catalogRepository.getNotesInCatalog(
        offset: notesList.length, limit: 10, jwtToken: jwtToken, id: id);
    notesBloc.add(ListResponseBlocEvent.fetch(
        result: result, initialListIsEmpty: notesList.isEmpty));
    if (result is GoodUseCaseResult<NotesListResponseModel>) {
      notesList.addAll(result.data.list);
    }
  }

  Future<void> refreshNotes(int id) async {
    if (id == -1) {
      notesBloc.add(ListResponseBlocEvent.error('Undefined catalog id!'));
      return;
    }
    notesList.clear();
    await getNotes(id);
  }
}
