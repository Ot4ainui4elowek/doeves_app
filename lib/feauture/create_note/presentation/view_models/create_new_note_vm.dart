import 'dart:async';
import 'dart:developer';

import 'package:doeves_app/core/domain/deferred_action.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/domain/view_model/view_model_factory.dart';
import 'package:doeves_app/feauture/create_note/domain/create_note/create_note_bloc.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page_controller.dart';
import 'package:doeves_app/feauture/create_note/presentation/view_models/create_note_page_vm.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/create_note_response_model.dart';
import 'package:reactive_variables/reactive_variables.dart';

class CreateNewNoteViewModel
    implements CreateNotePageViewModel, CreateViewModel {
  CreateNewNoteViewModel({
    required this.controller,
    this.catalogId,
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
  final int? catalogId;
  @override
  final Rv<int> noteId = Rv(-1);

  @override
  final CreateNotePageController controller;

  @override
  void init() {
    log('create new note view model');
    _createNote();
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
    log('dispose create new note view model');
  }

  Future<void> _createNote() async {
    controller.titleAndDescriptionBloc.add(const CreateNoteEvent.loading());
    final result = await controller.createNote(catalogId: catalogId);
    controller.titleAndDescriptionBloc
        .add(CreateNoteEvent.fetch(result: result));
    if (result is GoodUseCaseResult<IdResponseModel>) {
      noteId(result.data.id);
    }
  }

  final Duration _requestsTimerDuration = const Duration(seconds: 3);

  late final DeferredAction _descriptionDefferedAction;

  late final DeferredAction _titleDefferedAction;

  Future<void> _listenDescription() async {
    if (noteId.value == -1) {
      return;
    }
    final result = await controller.editDescription(noteId.value);
  }

  Future<void> _listenTitle() async {
    if (noteId.value == -1) {
      return;
    }
    final result = await controller.editTitle(noteId.value);
  }
}
