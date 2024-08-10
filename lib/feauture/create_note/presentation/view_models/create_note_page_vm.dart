import 'dart:developer';

import 'package:doeves_app/core/domain/view_model/view_model_factory.dart';
import 'package:doeves_app/feauture/create_note/domain/create_note_transfer_object.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page_controller.dart';
import 'package:doeves_app/feauture/create_note/presentation/view_models/create_new_note_vm.dart';
import 'package:doeves_app/feauture/create_note/presentation/view_models/open_note_vm.dart';
import 'package:reactive_variables/reactive_variables.dart';

abstract interface class CreateNotePageViewModel implements ViewModel {
  const CreateNotePageViewModel(this.controller, this.noteId);
  void init();
  void dispose();
  final CreateNotePageController controller;
  final Rv<int> noteId;

  factory CreateNotePageViewModel.createVM({
    CreateNotePageTransferObject? notesData,
    required CreateNotePageController controller,
  }) {
    switch (notesData) {
      case CreateNoteTransferObject(folderId: final catalogId):
        {
          log('folder');
          return CreateNewNoteViewModel(
            controller: controller,
            catalogId: catalogId,
          );
        }
      case OpenNoteTransferObject(:final noteId):
        {
          log('open');
          return OpenNoteViewModel(
            noteId: noteId,
            controller: controller,
          );
        }
    }
    log('create');
    return CreateNewNoteViewModel(
      controller: controller,
    );
  }
}
