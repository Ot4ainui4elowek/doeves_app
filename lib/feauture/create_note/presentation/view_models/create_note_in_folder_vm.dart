import 'dart:developer';

import 'package:doeves_app/feauture/create_note/presentation/create_note_page_controller.dart';
import 'package:doeves_app/feauture/create_note/presentation/view_models/create_note_page_vm.dart';

class CreateNoteInFolderViewModel implements CreateNotePageViewModel {
  const CreateNoteInFolderViewModel({
    required this.controller,
    required this.folderId,
  });

  final int folderId;

  @override
  final CreateNotePageController controller;

  @override
  void dispose() {
    log('dispsoe create note in folder vm');
  }

  @override
  void init() {
    log('create note in folder vm');
  }
}
