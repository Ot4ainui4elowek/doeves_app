import 'dart:developer';

import 'package:doeves_app/core/domain/view_model/view_model_factory.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/create_catalog_page_controller.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/view_models/create_catalog_page_vm.dart';
import 'package:reactive_variables/src/variable.dart';

class NewCatalogViewModel
    implements CreateCatalogPageViewModel, CreateViewModel {
  NewCatalogViewModel({
    required this.controller,
  });
  @override
  final Rv<int> catalogId = Rv(-1);

  @override
  final CreateCatalogPageController controller;

  @override
  void init() {
    log('create catalog vm');
  }

  @override
  Future<void> dispose() async {}
}
