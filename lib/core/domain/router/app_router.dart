import 'package:doeves_app/core/domain/container/app_container.dart';
import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/feauture/authorization/presentation/login_page/login_page.dart';
import 'package:doeves_app/feauture/authorization/presentation/login_page/login_page_vm.dart';
import 'package:doeves_app/feauture/authorization/presentation/registration_page/registration_page.dart';
import 'package:doeves_app/feauture/authorization/presentation/registration_page/registration_page_vm.dart';
import 'package:doeves_app/feauture/authorization/presentation/verification_page/verification_page.dart';
import 'package:doeves_app/feauture/authorization/presentation/verification_page/verification_page_vm.dart';
import 'package:doeves_app/feauture/create_catalog_page/domain/catalog_data_transfer_object.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/create_catalog_page.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/create_catalog_page_controller.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/view_models/create_catalog_page_vm.dart';
import 'package:doeves_app/feauture/create_note/domain/create_note_data_transfer_object.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page_controller.dart';
import 'package:doeves_app/feauture/create_note/presentation/view_models/create_note_page_vm.dart';
import 'package:doeves_app/feauture/error_page/presentation/error_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/catalogs_with_notes_page/catalogs_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/catalogs_with_notes_page/catalogs_page_vm.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/home_page/home_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/home_page/home_page_vm.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/main_page/main_page_large.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/main_page/main_page_small.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/tasks_page/tasks_page.dart';
import 'package:doeves_app/feauture/search_note_page/presentation/search_note_page.dart';
import 'package:doeves_app/feauture/search_note_page/presentation/search_note_page_vm.dart';
import 'package:doeves_app/feauture/select_new_note_page/presentation/pages/select_new_note_page.dart';
import 'package:doeves_app/feauture/select_new_note_page/presentation/pages/select_new_note_page_vm.dart';
import 'package:doeves_app/feauture/splash_screen/presentation/splash_screen.dart';
import 'package:doeves_app/feauture/splash_screen/presentation/splash_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'go_router.dart';

class AppRouter {
  static CreateCatalogPage createCatalogPage(
      {required CreateCatalogDataTransferObject? data}) {
    return CreateCatalogPage(
      vm: CreateCatalogPageViewModel.create(
          data: data,
          controller: CreateCatalogPageController(
            catalogRepository:
                AppContainer().repositoryScope.createCatalogRepository,
            secureStorage: AppContainer().secureScope.secureStorage,
          )),
    );
  }

  static CreateNotePage createNotePage({CreateNoteDataTransferObject? data}) {
    return CreateNotePage(
      vm: CreateNotePageViewModel.create(
          notesData: data,
          controller: CreateNotePageController(
            createNoteRepository:
                AppContainer().repositoryScope.createNoteRepository,
            secureStorage: AppContainer().secureScope.secureStorage,
          )),
    );
  }

  static final router = _goRouter;
}
