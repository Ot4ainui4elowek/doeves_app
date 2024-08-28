import 'package:doeves_app/core/domain/view_model/view_model_factory.dart';
import 'package:doeves_app/feauture/create_catalog_page/domain/catalog_data_transfer_object.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/create_catalog_page_controller.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/view_models/new_catalog_vm.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/view_models/open_catalog_vm.dart';

abstract interface class CreateCatalogPageViewModel implements ViewModel {
  CreateCatalogPageViewModel(this.controller, this.catalogId);

  void init();

  Future<void> dispose();

  int? catalogId;

  final CreateCatalogPageController controller;

  factory CreateCatalogPageViewModel.create({
    required final CreateCatalogPageController controller,
    final CreateCatalogDataTransferObject? data,
  }) {
    if (data != null) {
      switch (data) {
        case NewCatalogDataTransferObject():
          {
            return NewCatalogViewModel(controller: controller);
          }
        case OpenCatalogDataTrasferObject(:final catalog):
          {
            return OpenCatalogViewModel(
              catalog: catalog,
              controller: controller,
            );
          }
      }
    } else {
      return NewCatalogViewModel(controller: controller);
    }
  }
}
