import 'dart:developer';

import 'package:doeves_app/feauture/create_note/domain/note_data_transfer_object.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page_controller.dart';
import 'package:doeves_app/feauture/create_note/presentation/view_models/create_new_note_vm.dart';
import 'package:doeves_app/feauture/create_note/presentation/view_models/open_note_vm.dart';

abstract interface class CreateNotePageViewModel {
  const CreateNotePageViewModel(this.controller);
  void init();
  void dispose();
  final CreateNotePageController controller;

  factory CreateNotePageViewModel.createVM({
    CreateNotePageTransferObject? notesData,
    required CreateNotePageController controller,
  }) {
    switch (notesData) {
      case CreateNoteTransferObject(:final folderId):
        {
          log('folder');
          return CreateNewNoteViewModel(
            controller: controller,
            catalogId: folderId,
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
