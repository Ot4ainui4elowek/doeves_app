import 'dart:async';
import 'dart:math';

import 'package:doeves_app/core/data/secure_storage/secure_storage.dart';
import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/feauture/create_note/domain/create_note_repository.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/create_content_entity.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/tasks_list/create_task_list_impl.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/tasks_list/task_list_item.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/text/create_text_content_impl.dart';
import 'package:doeves_app/feauture/main_page/data/model/create_note_request_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/create_note_response_model.dart';
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

  // final noteIsLoadedSucessfully = false.rv;

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

  Map<CreateContentEnum, void Function()> get getAddContentList => {
        CreateContentEnum.text: addTextContent,
        CreateContentEnum.taskList: addTaskListContent,
      };

  Future<UseCaseResult<CreateNoteResponseModel>> getNote(
      {required int id, BuildContext? context}) async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 2));
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
    return await _createNoteRepository.getNote(id: id, jwtToken: jwt);
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

  Future<UseCaseResult<CreateNoteResponseModel>> createNote() async {
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
            name: titleTextController.text),
        jwtToken: jwt);
  }

  void addTextContent() {
    contentList.add(CreateTextContentImpl());
  }

  void addTaskListContent() {
    contentList
        .add(CreateTasksListImpl([TaskListItem(id: Random().nextInt(10000))]));
  }

  void deleteContent(int id) {
    contentList.removeWhere((content) => content.id == id);
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
