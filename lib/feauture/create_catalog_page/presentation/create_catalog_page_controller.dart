import 'package:doeves_app/core/data/secure_storage/secure_storage.dart';
import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/feauture/create_catalog_page/domain/create_catalog_respository.dart';
import 'package:doeves_app/feauture/create_note/domain/create_note_page_transfer_object.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/notes_list/notes_list_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/remove_list_of_notes/empty_good_response.dart';
import 'package:doeves_app/feauture/main_page/domain/response_bloc/response_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_variables/reactive_variables.dart';

class CreateCatalogPageController {
  CreateCatalogPageController({
    required CreateCatalogRepository catalogRepository,
    required SecureStorage secureStorage,
  })  : _secureStorage = secureStorage,
        _catalogRepository = catalogRepository;

  final scrollController = ScrollController();

  final allNotesIsSelected = false.rv;

  final notesBloc = ResponseBloc();

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
      context.push(AppRoutes.createNotePage,
          extra: OpenNoteTransferObject(note.id));
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
      return UseCaseResult.bad([SpecificError('undefined jwt token!')]);
    }
    return await _catalogRepository.editCatalogName(
        jwtToken: jwtToken,
        id: id,
        catalogName: catalognameController.text.trim());
  }

  Future<void> getNotes(int id) async {
    final jwtToken = await _secureStorage.readToken();

    isLoading(true);
    notesBloc.add(ResponseBlocEvent.loading());
    if (jwtToken == null) {
      notesBloc.add(ResponseBlocEvent.error('undefined jwt token!'));
      isLoading(false);
      return;
    }
    final result = await _catalogRepository.getNotesInCatalog(
        offset: notesList.length, limit: 10, jwtToken: jwtToken, id: id);
    notesBloc.add(ResponseBlocEvent.fetch(
        result: result, initialListIsEmpty: notesList.isEmpty));
    if (result is GoodUseCaseResult<NotesListResponseModel>) {
      notesList.addAll(result.data.list);
    }
  }
}
