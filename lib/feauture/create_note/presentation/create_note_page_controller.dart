import 'dart:async';

import 'package:doeves_app/core/data/secure_storage/secure_storage.dart';
import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/feauture/create_note/domain/create_note/create_note_bloc.dart';
import 'package:doeves_app/feauture/create_note/domain/create_note_repository.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/create_content_entity.dart';
import 'package:doeves_app/feauture/main_page/data/model/create_note_request_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/create_note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/remove_list_of_notes/remove_notes_remote_response.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

enum CreateContentEnum {
  text,
  taskList;
}

class CreateNotePageController {
  CreateNotePageController({
    required SecureStorage secureStorage,
    required CreateNoteRepository createNoteRepository,
  })  : _secureStorage = secureStorage,
        _createNoteRepository = createNoteRepository;
  final titleAndDescriptionBloc = CreateNoteBloc();
  // void init({required bool isEditedNote}) {
  //   if (isEditedNote) {
  //     _initEditedNote();
  //   } else {
  //     _initNewNote();
  //   }
  // }

  // void _initEditedNote() {
  //   descriptionTextController.addListener(listenDescription);
  // }

  // void _initNewNote() {
  //   titleTextController.addListener(checkNoteisValid);
  //   descriptionTextController.addListener(checkNoteisValid);
  // }

  // void dispose({required bool isEditedNote}) {
  //   if (isEditedNote) {
  //     _disposeEditedNote();
  //   } else {
  //     _disposeNewNote();
  //   }
  // }

  // _disposeEditedNote() {
  //   descriptionTextController.removeListener(listenDescription);
  // }

  // void _disposeNewNote() {
  //   titleTextController.removeListener(checkNoteisValid);
  //   descriptionTextController.removeListener(checkNoteisValid);
  // }

  // final noteIsValid = false.rv;

  // void checkNoteisValid() {
  //   noteIsValid(titleTextController.text.isNotEmpty ||
  //       descriptionTextController.text.isNotEmpty);
  // }

  final noteIsLoadedSucessfully = false.rv;

  // Timer? t;
  // void listenDescription() {
  //   if (noteIsLoadedSucessfully.value) {
  //     noteIsLoadedSucessfully(false);
  //     return;
  //   }
  //   if (t != null) {
  //     t!.cancel();
  //   }

  //   t = Timer(
  //     const Duration(seconds: 1),
  //     () => debugPrint(descriptionTextController.text),
  //   );
  // }

  final CreateNoteRepository _createNoteRepository;

  final descriptionTextController = AppTextEditingController();
  final titleTextController = AppTextEditingController();

  final SecureStorage _secureStorage;

  final isLoading = false.rv;

  Future<UseCaseResult<NoteResponseModel>> getNote(
      {required int id, BuildContext? context}) async {
    titleAndDescriptionBloc.add(const CreateNoteEvent.loading());

    await Future.delayed(const Duration(seconds: 2));

    final jwt = await _secureStorage.readToken();

    if (jwt == null) {
      final UseCaseResult<NoteResponseModel> result = UseCaseResult.bad(
        [
          SpecificError('undefined jwt token'),
        ],
      );
      titleAndDescriptionBloc.add(CreateNoteEvent.fetch(result: result));
      return result;
    }
    final result = await _createNoteRepository.getNote(id: id, jwtToken: jwt);

    titleAndDescriptionBloc.add(CreateNoteEvent.fetch(result: result));

    return result;
    // if (context.mounted && result is! GoodUseCaseResult) {
    //   _notificationService.responseNotification(
    //       response: result,
    //       context: context,
    //       goodUseCaseMessage: 'Note load successfully');
    // } else
    // if (result is GoodUseCaseResult<CreateNoteResponseModel>) {
    //   // noteIsLoadedSucessfully(true);
    //   final note = result.data;
    //   titleTextController.text = note.name;
    //   descriptionTextController.text = note.description;
    // }
  }

  Future<UseCaseResult<RemoveNoteRemoteResponse>> deleteNote({
    required int id,
  }) async {
    final jwt = await _secureStorage.readToken();

    if (jwt == null) {
      return UseCaseResult.bad(
        [
          SpecificError('undefined jwt token'),
        ],
      );
    }
    return await _createNoteRepository.deleteNote(id: id, jwtToken: jwt);
  }

  Future<UseCaseResult<CreateNoteResponseModel>> createNote({
    int? catalogId,
  }) async {
    isLoading(true);
    final jwt = await _secureStorage.readToken();
    if (jwt == null) {
      isLoading(false);
      return UseCaseResult.bad(
        [
          SpecificError('undefined jwt token'),
        ],
      );
    }
    isLoading(false);
    return await _createNoteRepository.createNote(
        note: CreateNoteRequestModel(
          description: descriptionTextController.text,
          name: titleTextController.text,
          catalogId: catalogId,
        ),
        jwtToken: jwt);
  }

  final Rv<List<CreateContentEntity>> contentList = Rv([]);

  void onContentDrag({
    required int oldIndex,
    required int newIndex,
    required BuildContext context,
  }) {
    if (oldIndex < newIndex) {
      newIndex--;
    }
    final content = contentList.removeAt(oldIndex);
    contentList.value.insert(newIndex, content);
  }
}
