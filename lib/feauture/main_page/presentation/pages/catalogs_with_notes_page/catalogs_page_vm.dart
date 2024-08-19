import 'dart:developer';

import 'package:doeves_app/core/data/secure_storage/secure_storage.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/notification_service/notification_service.dart';
import 'package:doeves_app/core/presentation/notification_service/snack_bar_notification_service/snack_bar_notification_service_impl.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalog_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalogs_list_response_model.dart';
import 'package:doeves_app/feauture/main_page/domain/repository/catalogs/catalogs_repository.dart';
import 'package:doeves_app/feauture/main_page/domain/response_bloc/response_bloc.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/vm/pagination_selectable_list_vm.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class CatalogsPageViewModel {
  CatalogsPageViewModel({
    required CatalogsRepository catalogsRepository,
    required SecureStorage secureStorage,
  })  : _secureStorage = secureStorage,
        _catalogsRepository = catalogsRepository {
    _paginationSelectableList = PaginationSelectableListController(
      checkAllEntitysIsSelected: _checkAllNotesIsSelected,
      entitysList: catalogsList,
      getEntitys: getEntitys,
      selectedEntitysList: selectedList,
    );
  }

  final CatalogsRepository _catalogsRepository;

  final SecureStorage _secureStorage;

  final NotificationService _notificationService =
      SnackBarNotificationServiceImpl();

  final catalogsBloc = ResponseBloc();

  void init() {
    catalogsBloc.add(ResponseBlocEvent.loading());
    _getCatalogs();
    _paginationSelectableList.init();
  }

  void dispose() {
    _paginationSelectableList.dispose();
  }

  ScrollController get scrollController =>
      _paginationSelectableList.scrollController;

  Rv<bool> get isSelectedMode => _paginationSelectableList.isSelectedMode;

  late final PaginationSelectableListController<CatalogResponseModel, int>
      _paginationSelectableList;

  final _limit = 10.rv;

  final isLoading = false.rv;

  Future<void> _getCatalogs() async {
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

  void onPressedCatalog(
    int id,
  ) {
    if (isSelectedMode.value) {
      _onPressedCatalogSelectedMode(id);
    } else {
      log('open');
    }
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
    await _getCatalogs();
  }

  final Rv<List<int>> selectedList = Rv([]);

  final Rv<List<CatalogResponseModel>> catalogsList = Rv([]);

  Future<void> getEntitys() async {
    catalogsBloc.add(ResponseBlocEvent.loading());
    await _getCatalogs();
  }

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
  }

  void _checkAllNotesIsSelected() {
    allCatalogsIsSelected(
        catalogsList.length == selectedList.length && catalogsList.isNotEmpty);
  }
}
