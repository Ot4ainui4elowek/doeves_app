import 'dart:developer';

import 'package:doeves_app/feauture/create_note/presentation/create_note_page_controller.dart';
import 'package:doeves_app/feauture/create_note/presentation/view_models/create_note_page_vm.dart';

class CreateNewNoteViewModel implements CreateNotePageViewModel {
  CreateNewNoteViewModel({
    required this.controller,
  });

  @override
  final CreateNotePageController controller;

  @override
  void dispose() {
    log('dispose create new note view model');
  }

  @override
  void init() {
    log('create new note view model');
  }
}
