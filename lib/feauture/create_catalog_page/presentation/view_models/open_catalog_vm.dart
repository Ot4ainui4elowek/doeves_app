import 'package:doeves_app/core/domain/view_model/view_model_factory.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/create_catalog_page_controller.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/view_models/create_catalog_page_vm.dart';
import 'package:reactive_variables/reactive_variables.dart';

class OpenCatalogViewModel
    implements CreateCatalogPageViewModel, OpenViewModel {
  OpenCatalogViewModel({
    required int catalogId,
    required this.controller,
  }) {
    this.catalogId(catalogId);
  }
  @override
  final Rv<int> catalogId = Rv(-1);

  @override
  final CreateCatalogPageController controller;

  @override
  Future<void> dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  @override
  void init() {
    // TODO: implement init
  }
}
