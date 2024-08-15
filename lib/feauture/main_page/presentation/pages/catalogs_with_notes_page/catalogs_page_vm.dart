import 'package:doeves_app/core/data/secure_storage/secure_storage.dart';
import 'package:doeves_app/core/presentation/notification_service/notification_service.dart';
import 'package:doeves_app/core/presentation/notification_service/snack_bar_notification_service/snack_bar_notification_service_impl.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalog_response_model.dart';
import 'package:doeves_app/feauture/main_page/domain/repository/catalogs/catalogs_repository.dart';
import 'package:doeves_app/feauture/main_page/domain/response_bloc/response_bloc.dart';
import 'package:reactive_variables/reactive_variables.dart';

class CatalogsPageViewModel {
  CatalogsPageViewModel({
    required CatalogsRepository catalogsRepository,
    required SecureStorage secureStorage,
  })  : _secureStorage = secureStorage,
        _catalogsRepository = catalogsRepository;

  final CatalogsRepository _catalogsRepository;

  final SecureStorage _secureStorage;

  final NotificationService _notificationService =
      SnackBarNotificationServiceImpl();

  final _catalogsBloc = ResponseBloc();

  final isLoading = false.rv;

  void init() {}

  void dispose() {}

  final _limit = 10.rv;

  Future<void> getCatalogs() async {
    isLoading(true);
    _catalogsBloc.add(ResponseBlocEvent.loading());
    final jwtToken = await _secureStorage.readToken();
    if (jwtToken == null) {
      return;
    }
    final result = await _catalogsRepository.getCatalogs(
        jwtToken: jwtToken, offset: catalogsList.length, limit: _limit.value);
    _catalogsBloc.add(ResponseBlocEvent.fetch(
        result: result, initialListIsEmpty: catalogsList.isEmpty));
    isLoading(false);
  }

  final isSelectedMode = false.rv;

  final Rv<List<CatalogResponseModel>> catalogsList = Rv([]);
}
