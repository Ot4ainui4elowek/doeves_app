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
import 'package:reactive_variables/reactive_variables.dart';

class CatalogsPageViewModel extends PaginationSelectableListViewModel {
  CatalogsPageViewModel({
    required CatalogsRepository catalogsRepository,
    required SecureStorage secureStorage,
  })  : _secureStorage = secureStorage,
        _catalogsRepository = catalogsRepository;

  final CatalogsRepository _catalogsRepository;

  final SecureStorage _secureStorage;

  final NotificationService _notificationService =
      SnackBarNotificationServiceImpl();

  final catalogsBloc = ResponseBloc();

  @override
  void init() {
    catalogsBloc.add(ResponseBlocEvent.loading());
    getCatalogs();
    super.init();
  }

  final _limit = 10.rv;

  Future<void> getCatalogs() async {
    isLoading(true);
    catalogsBloc.add(ResponseBlocEvent.loading());
    final jwtToken = await _secureStorage.readToken();

    if (jwtToken == null) {
      return;
    }
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

  Future<void> refreshCatalogs() async {
    catalogsList.clear();
    await getCatalogs();
  }

  final Rv<List<int>> selectedList = Rv([]);

  final Rv<List<CatalogResponseModel>> catalogsList = Rv([]);

  @override
  Future<void> getEntitys() async {
    catalogsBloc.add(ResponseBlocEvent.loading());
    await getCatalogs();
  }

  @override
  Rv<List> get entitysList => catalogsList;

  final allCatalogsIsSelected = false.rv;

  @override
  void checkAllNotesIsSelected() {
    allCatalogsIsSelected(
        catalogsList.length == selectedList.length && catalogsList.isNotEmpty);
  }

  @override
  Rv<List> get selectedEntitysList => selectedList;
}
