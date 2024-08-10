import 'dart:developer';

import 'package:doeves_app/core/domain/deferred_action.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/domain/view_model/view_model_factory.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page_controller.dart';
import 'package:doeves_app/feauture/create_note/presentation/view_models/create_note_page_vm.dart';
import 'package:doeves_app/feauture/main_page/data/model/note_response_model.dart';
import 'package:reactive_variables/reactive_variables.dart';

class OpenNoteViewModel implements CreateNotePageViewModel, OpenViewModel {
  OpenNoteViewModel({
    required this.controller,
    required int noteId,
  }) {
    this.noteId(noteId);
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
  final Rv<int> noteId = Rv(-1);

  @override
  final CreateNotePageController controller;

  final _noteIsLoadedSucessfully = false.rv;

  @override
  void init() {
    log('open note vm');
    _getNote();
    controller.descriptionTextController
        .addListener(_descriptionDefferedAction.call);
    controller.titleTextController.addListener(_titleDefferedAction.call);
  }

  @override
  void dispose() {
    log('dispose open note vm');
    controller.descriptionTextController
        .removeListener(_descriptionDefferedAction.call);
    controller.titleTextController.removeListener(_titleDefferedAction.call);
  }

  final Duration _requestsTimerDuration = const Duration(seconds: 3);

  late final DeferredAction _descriptionDefferedAction;

  late final DeferredAction _titleDefferedAction;

  Future<void> _listenDescription() async {
    if (_noteIsLoadedSucessfully.value) {
      return;
    }
    final result = await controller.editDescription(noteId.value);
  }

  Future<void> _listenTitle() async {
    if (_noteIsLoadedSucessfully.value) {
      return;
    }
    final result = await controller.editTitle(noteId.value);
  }

  void _getNote() async {
    final result = await controller.getNote(id: noteId.value);

    if (result is GoodUseCaseResult<NoteResponseModel>) {
      _noteIsLoadedSucessfully(true);
      final note = result.data;
      controller.titleTextController.text = note.name;
      controller.descriptionTextController.text = note.description;
    }
    Future.delayed(
        _requestsTimerDuration, () => _noteIsLoadedSucessfully(false));
  }
}
