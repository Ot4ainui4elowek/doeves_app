import 'dart:developer';

import 'package:doeves_app/core/domain/deferred_action.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page_controller.dart';
import 'package:doeves_app/feauture/create_note/presentation/view_models/create_note_page_vm.dart';
import 'package:doeves_app/feauture/main_page/data/model/note_response_model.dart';
import 'package:flutter/material.dart';

class OpenNoteViewModel implements CreateNotePageViewModel {
  OpenNoteViewModel({
    required this.controller,
    required this.noteId,
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

  final int noteId;

  @override
  final CreateNotePageController controller;

  @override
  void dispose() {
    log('dispose open note vm');
    controller.descriptionTextController
        .removeListener(_descriptionDefferedAction.call);
    controller.titleTextController.removeListener(_titleDefferedAction.call);
  }

  @override
  void init() {
    log('open note vm');
    _getNote();
    controller.descriptionTextController
        .addListener(_descriptionDefferedAction.call);
    controller.titleTextController.addListener(_titleDefferedAction.call);
  }

  final Duration _requestsTimerDuration = const Duration(seconds: 2);

  late final DeferredAction _descriptionDefferedAction;

  late final DeferredAction _titleDefferedAction;

  Future<void> _listenDescription() async {
    if (controller.noteIsLoadedSucessfully.value) {
      return;
    }
    debugPrint(controller.descriptionTextController.text);
  }

  Future<void> _listenTitle() async {
    if (controller.noteIsLoadedSucessfully.value) {
      return;
    }
    debugPrint(controller.titleTextController.text);
  }

  void _getNote() async {
    final result = await controller.getNote(id: noteId);
    if (result is GoodUseCaseResult<NoteResponseModel>) {
      controller.noteIsLoadedSucessfully(true);
      final note = result.data;
      controller.titleTextController.text = note.name;
      controller.descriptionTextController.text = note.description;
    }
    Future.delayed(_requestsTimerDuration,
        () => controller.noteIsLoadedSucessfully(false));
  }
}
