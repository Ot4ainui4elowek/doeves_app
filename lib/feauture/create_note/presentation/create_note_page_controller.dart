import 'dart:async';

import 'package:doeves_app/core/data/secure_storage/secure_storage.dart';
import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/notification_service/snack_bar_notification_service/snack_bar_notification_service_impl.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/feauture/create_note/domain/create_note/create_note_bloc.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/create_content_entity.dart';
import 'package:doeves_app/feauture/create_note/domain/repository/create_note_repository.dart';
import 'package:doeves_app/feauture/main_page/data/model/create_note_request_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/create_note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/remove_list_of_notes/empty_good_response.dart';
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

  final CreateNoteRepository _createNoteRepository;

  final descriptionTextController = AppTextEditingController();

  final titleTextController = AppTextEditingController();

  final SecureStorage _secureStorage;

  final isLoading = false.rv;

  final _notificationService = SnackBarNotificationServiceImpl();

  Future<UseCaseResult<EmptyGoodResponse>> editTitle(int id) async {
    final jwt = await _secureStorage.readToken();

    if (jwt == null) {
      final UseCaseResult<EmptyGoodResponse> result = UseCaseResult.bad(
        [
          SpecificError('undefined jwt token'),
        ],
      );
      titleAndDescriptionBloc.add(CreateNoteEvent.fetch(result: result));
      return result;
    }
    final result = await _createNoteRepository.editTitle(
        id: id, jwtToken: jwt, newTitle: titleTextController.text);

    return result;
  }

  Future<UseCaseResult<EmptyGoodResponse>> editDescription(int id) async {
    final jwt = await _secureStorage.readToken();

    if (jwt == null) {
      final UseCaseResult<EmptyGoodResponse> result = UseCaseResult.bad(
        [
          SpecificError('undefined jwt token'),
        ],
      );
      titleAndDescriptionBloc.add(CreateNoteEvent.fetch(result: result));
      return result;
    }
    final result = await _createNoteRepository.editDescription(
        id: id, jwtToken: jwt, newDescription: descriptionTextController.text);

    return result;
  }

  Future<UseCaseResult<NoteResponseModel>> getNote({
    required int id,
  }) async {
    titleAndDescriptionBloc.add(const CreateNoteEvent.loading());

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
  }

  Future<UseCaseResult<RemoveNoteRemoteResponse>> deleteNote(
      {required int id, required BuildContext context}) async {
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
    await Future.delayed(const Duration(seconds: 3));
    final jwt = await _secureStorage.readToken();
    if (jwt == null) {
      return UseCaseResult.bad(
        [
          SpecificError('undefined jwt token'),
        ],
      );
    }
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
