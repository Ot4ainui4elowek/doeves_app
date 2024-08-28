import 'dart:async';
import 'dart:developer';

import 'package:doeves_app/core/data/secure_storage/secure_storage.dart';
import 'package:doeves_app/core/domain/data_transfer_handler.dart';
import 'package:doeves_app/core/domain/data_transfer_object.dart';
import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/notification_service/notification_service.dart';
import 'package:doeves_app/core/presentation/notification_service/snack_bar_notification_service/snack_bar_notification_service_impl.dart';
import 'package:doeves_app/feauture/create_catalog_page/domain/catalog_data_transfer_object.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalog_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalogs_list_response_model.dart';
import 'package:doeves_app/feauture/main_page/domain/repository/catalogs/catalogs_repository.dart';
import 'package:doeves_app/feauture/main_page/domain/response_bloc/response_bloc.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/vm/pagination_selectable_list_vm.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_variables/reactive_variables.dart';

class CatalogsPageViewModel with DataTransferHandler<CatalogResponseModel> {
  CatalogsPageViewModel({
    required CatalogsRepository catalogsRepository,
    required SecureStorage secureStorage,
  })  : _secureStorage = secureStorage,
        _catalogsRepository = catalogsRepository {
    _catalogListController = PaginationSelectableListController(
      scrollController: scrollController,
      checkAllEntitysIsSelected: _checkAllNotesIsSelected,
      entitysList: catalogsList,
      getEntitys: getCatalogs,
      selectedEntitysList: selectedList,
    );
  }

  final scrollController = ScrollController();

  final CatalogsRepository _catalogsRepository;

  final SecureStorage _secureStorage;

  final NotificationService _notificationService =
      SnackBarNotificationServiceImpl();

  final catalogsBloc = ResponseBloc();

  Future<void> init() async {
    await getCatalogs();
    _catalogListController.init();
  }

  void didUpdateWidget() {
    _catalogListController.init();
  }

  void dispose() {
    _catalogListController.dispose();
  }

  Rv<bool> get isSelectedMode => _catalogListController.isSelectedMode;

  late final PaginationSelectableListController<CatalogResponseModel, int>
      _catalogListController;

  final _limit = 10.rv;

  final isLoading = false.rv;

  Future<void> getCatalogs() async {
    final jwtToken = await _secureStorage.readToken();

    if (jwtToken == null) {
      return;
    }
    isLoading(true);
    catalogsBloc.add(ResponseBlocEvent.loading());
    final result = await _catalogsRepository.getCatalogs(
        jwtToken: jwtToken, offset: catalogsList.length, limit: _limit.value);
    catalogsBloc.add(ResponseBlocEvent.fetch(
        result: result, initialListIsEmpty: catalogsList.isEmpty));
    isLoading(false);

    if (result is DataBadUseCaseResult<CatalogsListResponseModel>) {
      log(result.errorData.message);
    }
    if (result is GoodUseCaseResult<CatalogsListResponseModel>) {
      catalogsList.addAll(result.data.list);
    }
    catalogsBloc.add(ResponseBlocEvent.fetch(
        result: result, initialListIsEmpty: catalogsList.isEmpty));
  }

  FutureOr<void> onPressedCatalog(
      {required CatalogResponseModel catalog,
      required BuildContext context}) async {
    if (isSelectedMode.value) {
      _onPressedCatalogSelectedMode(catalog.id);
    } else {
      _openCatalog(context: context, catalog: catalog);
    }
  }

  Future<void> _openCatalog(
      {required CatalogResponseModel catalog,
      required BuildContext context}) async {
    final result = await context.push<DataTransferObject<CatalogResponseModel>>(
        AppRoutes.createCatalogPage,
        extra: OpenCatalogDataTrasferObject(catalog));
    _goToCreateCatalogPage(result);
  }

  void _goToCreateCatalogPage(DataTransferObject<CatalogResponseModel>? data) {
    requestToPage(
      data: data,
      create: (data) {
        catalogsList.value.insert(0, data);
        catalogsList.refresh();
      },
      delete: (deletedData) {
        final index = catalogsList.value
            .indexWhere((catalog) => catalog.id == deletedData.id);
        if (index == -1) {
          return;
        }
        catalogsList.removeAt(index);
      },
      edit: (editData) {
        final index = catalogsList.value
            .indexWhere((catalog) => catalog.id == editData.id);
        log('$index ${editData.name}');
        if (index == -1) {
          return;
        }
        catalogsList.value[index] = editData;
        catalogsList.refresh();
        log('edit');
      },
    );
  }

  Future<void> createCatalog(BuildContext context) async {
    context.push(AppRoutes.createCatalogPage,
        extra: CreateCatalogDataTransferObject.create());
  }

  void _onPressedCatalogSelectedMode(int id) {
    if (selectedList.value.contains(id)) {
      selectedList.remove(id);
    } else {
      selectedList.add(id);
    }
  }

  Future<void> refreshCatalogs() async {
    catalogsList.clear();
    await getCatalogs();
  }

  final Rv<List<int>> selectedList = Rv([]);

  final Rv<List<CatalogResponseModel>> catalogsList = Rv([]);

  final allCatalogsIsSelected = false.rv;

  void onPressedSelectAllButton() {
    if (allCatalogsIsSelected.value) {
      selectedList.clear();
    } else {
      selectedList.addAll(catalogsList.map((catalog) => catalog.id));
    }
  }

  Future<void> deleteCatalogs(BuildContext context) async {
    final jwtToken = await _secureStorage.readToken();

    if (jwtToken == null) {
      return;
    }
    final result = await _catalogsRepository.deleteCatalog(
        jwtToken: jwtToken, idList: selectedList.value);
    if ((result is BadUseCaseResult || result is DataBadUseCaseResult) &&
        context.mounted) {
      _notificationService.responseNotification(
          result: result,
          context: context,
          goodUseCaseMessage: 'Catalogs successfully deleted!');
    } else {
      catalogsList
          .removeWhere((catalog) => selectedList.value.contains(catalog.id));
    }
    selectedList.clear();
    isSelectedMode(false);
    if (catalogsList.isEmpty) {
      getCatalogs();
    }
  }

  void _checkAllNotesIsSelected() {
    allCatalogsIsSelected(
        catalogsList.length == selectedList.length && catalogsList.isNotEmpty);
  }
}
