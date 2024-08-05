import 'dart:developer';

import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page_controller.dart';
import 'package:doeves_app/feauture/create_note/presentation/view_models/create_new_note_vm.dart';
import 'package:doeves_app/feauture/main_page/data/model/create_note_response_model.dart';

class OpenNoteViewModel implements CreateNewNoteViewModel {
  const OpenNoteViewModel({
    required this.controller,
    required this.noteId,
  });

  final int noteId;

  @override
  final CreateNotePageController controller;

  @override
  void dispose() {
    log('dispose open note vm');
  }

  @override
  void init() {
    log('open note vm');
    _getNote();
  }

  void _getNote() async {
    final result = await controller.getNote(id: noteId);
    if (result is GoodUseCaseResult<CreateNoteResponseModel>) {
      final note = result.data;
      controller.titleTextController.text = note.name;
      controller.descriptionTextController.text = note.description;
    }
  }
}
