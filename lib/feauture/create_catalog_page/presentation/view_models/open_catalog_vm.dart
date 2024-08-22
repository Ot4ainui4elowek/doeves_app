import 'dart:developer';

import 'package:doeves_app/core/domain/view_model/view_model_factory.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/create_catalog_page_controller.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/view_models/create_catalog_page_vm.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/note_response_model.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/vm/pagination_selectable_list_vm.dart';
import 'package:reactive_variables/reactive_variables.dart';

class OpenCatalogViewModel
    implements CreateCatalogPageViewModel, OpenViewModel {
  OpenCatalogViewModel({
    required int catalogId,
    required this.controller,
  }) : _catalogId = catalogId {
    this.catalogId(_catalogId);
    notesListController = PaginationSelectableListController(
        scrollController: controller.scrollController,
        checkAllEntitysIsSelected: _checkAllNotesIsSelected,
        entitysList: controller.notesList,
        getEntitys: () => controller.getNotes(catalogId),
        selectedEntitysList: controller.selectedList);
  }

  void _checkAllNotesIsSelected() {
    controller.allNotesIsSelected(
        controller.notesList.length == controller.selectedList.length &&
            controller.notesList.isNotEmpty);
  }

  late final PaginationSelectableListController<NoteResponseModel, int>
      notesListController;

  @override
  final Rv<int> catalogId = Rv(-1);

  final int _catalogId;

  @override
  final CreateCatalogPageController controller;

  @override
  void init() {
    log('init open vm $_catalogId');

    notesListController.init();
    controller.getNotes(_catalogId);
  }

  @override
  Future<void> dispose() async {
    notesListController.dispose();
  }
}
