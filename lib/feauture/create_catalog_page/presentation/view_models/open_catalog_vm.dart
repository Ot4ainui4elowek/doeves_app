import 'dart:developer';

import 'package:doeves_app/core/domain/deferred_action.dart';
import 'package:doeves_app/core/domain/view_model/view_model_factory.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/create_catalog_page_controller.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/view_models/create_catalog_page_vm.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalog_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/note_response_model.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/vm/pagination_selectable_list_vm.dart';
import 'package:reactive_variables/reactive_variables.dart';

class OpenCatalogViewModel
    implements CreateCatalogPageViewModel, OpenViewModel {
  OpenCatalogViewModel({
    required CatalogResponseModel catalog,
    required this.controller,
  }) : _catalog = catalog {
    catalogId = catalog.id;

    editCatalogName = DeferredAction(callback: _editCatalogName);

    notesListController = PaginationSelectableListController(
        scrollController: controller.scrollController,
        checkAllEntitysIsSelected: _checkAllNotesIsSelected,
        entitysList: controller.notesList,
        getEntitys: () => controller.getNotes(_catalogId),
        selectedEntitysList: controller.selectedList);
  }

  void _checkAllNotesIsSelected() {
    controller.allNotesIsSelected(
        controller.notesList.length == controller.selectedList.length &&
            controller.notesList.isNotEmpty);
  }

  late final PaginationSelectableListController<NoteResponseModel, int>
      notesListController;

  final CatalogResponseModel _catalog;

  @override
  int? catalogId;

  int get _catalogId => _catalog.id;

  @override
  final CreateCatalogPageController controller;

  @override
  void init() {
    log('init open vm $catalogId');
    controller.catalogId(_catalogId);
    controller.catalognameController.addListener(editCatalogName.call);
    notesListController.init();
    controller.getNotes(_catalogId);
    controller.catalognameController.text = _catalog.name;
  }

  @override
  Future<void> dispose() async {
    controller.catalognameController.removeListener(editCatalogName.call);
    notesListController.dispose();
    editCatalogName.dispose();
  }

  Future<void> _editCatalogName() async {
    await controller.editCatalogName(_catalogId);
  }

  late final DeferredAction editCatalogName;
}
