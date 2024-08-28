import 'dart:developer';

import 'package:doeves_app/core/domain/blocs/list_response_bloc/list_response_bloc.dart';
import 'package:doeves_app/core/domain/deferred_action.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/domain/view_model/view_model_factory.dart';
import 'package:doeves_app/feauture/authorization/data/model/http_status_and_errors.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/create_catalog_page_controller.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/view_models/create_catalog_page_vm.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/create_note_response_model.dart';

class NewCatalogViewModel
    implements CreateCatalogPageViewModel, CreateViewModel {
  NewCatalogViewModel({
    required this.controller,
  }) {
    editCatalogName = DeferredAction(callback: _editCatalogName);
  }
  @override
  int? catalogId;

  @override
  final CreateCatalogPageController controller;

  @override
  void init() {
    log('new catalog vm');
    _createCatalog();
    controller.catalognameController.addListener(editCatalogName.call);
  }

  @override
  Future<void> dispose() async {
    controller.catalognameController.removeListener(editCatalogName.call);
    editCatalogName.dispose();
  }

  late final DeferredAction editCatalogName;

  Future<void> _createCatalog() async {
    final result = await controller.createCatalog();
    switch (result) {
      case GoodUseCaseResult<IdResponseModel>(:final data):
        {
          catalogId = data.id;
          controller.catalogId(catalogId);
        }
      case BadUseCaseResult<IdResponseModel>(:final errorList):
        {
          controller.notesBloc.add(
            ListResponseBlocEvent.error(
              errorList.isNotEmpty
                  ? errorList[0].code
                  : HttpStatusAndErrors.invalidRequest.value,
            ),
          );
        }
      case DataBadUseCaseResult<IdResponseModel>(:final errorData):
        {
          controller.notesBloc.add(
            ListResponseBlocEvent.error(errorData.message),
          );
        }
    }
  }

  Future<void> _editCatalogName() async {
    if (catalogId != null) {
      await controller.editCatalogName(catalogId!);
    }
  }
}
