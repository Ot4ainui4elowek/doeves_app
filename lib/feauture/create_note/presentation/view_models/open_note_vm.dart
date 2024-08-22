import 'dart:developer';

import 'package:doeves_app/core/domain/deferred_action.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/domain/view_model/view_model_factory.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page_controller.dart';
import 'package:doeves_app/feauture/create_note/presentation/view_models/create_note_page_vm.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/note_response_model.dart';

class OpenNoteViewModel implements CreateNotePageViewModel, OpenViewModel {
  OpenNoteViewModel({
    required this.controller,
    required int this.noteId,
  }) {
    _descriptionDefferedAction = DeferredAction(
      callback: _listenDescription,
      delay: _requestsTimerDuration,
    );
    _titleDefferedAction = DeferredAction(
      callback: _listenTitle,
      delay: _requestsTimerDuration,
    );
  }

  @override
  int? noteId;

  @override
  final CreateNotePageController controller;

  @override
  void init() {
    controller.noteId(noteId);
    log('open note vm');
    _getNote();
    controller.descriptionTextController
        .addListener(_descriptionDefferedAction.call);
    controller.titleTextController.addListener(_titleDefferedAction.call);
  }

  @override
  Future<void> dispose() async {
    controller.descriptionTextController
        .removeListener(_descriptionDefferedAction.call);
    controller.titleTextController.removeListener(_titleDefferedAction.call);
    await _descriptionDefferedAction.dispose();
    await _titleDefferedAction.dispose();

    log('dispose open note vm');
  }

  final Duration _requestsTimerDuration = const Duration(seconds: 3);

  late final DeferredAction _descriptionDefferedAction;

  late final DeferredAction _titleDefferedAction;

  Future<void> _listenDescription() async {
    final result = await controller.editDescription(noteId!);
  }

  Future<void> _listenTitle() async {
    final result = await controller.editTitle(noteId!);
  }

  void _getNote() async {
    final result = await controller.getNote(id: noteId!);

    if (result is GoodUseCaseResult<NoteResponseModel>) {
      final note = result.data;
      controller.titleTextController.text = note.name;
      controller.descriptionTextController.text = note.description;
    }
  }
}
