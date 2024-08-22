import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/rest_api_handler.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/authorization/data/model/http_status_and_errors.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalogs_list_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/remove_list_of_notes/empty_good_response.dart';
import 'package:doeves_app/feauture/main_page/data/source/catalogs_data_source.dart';
import 'package:doeves_app/feauture/main_page/domain/repository/catalogs/catalogs_repository.dart';

class CatalogsRepositoryImpl with RestApiHandler implements CatalogsRepository {
  CatalogsRepositoryImpl(
      {required CatalogsClientDataSource catalogsClientDataSource})
      : _catalogsClientDataSource = catalogsClientDataSource;

  final CatalogsClientDataSource _catalogsClientDataSource;

  @override
  Future<UseCaseResult<EmptyGoodResponse>> deleteCatalog({
    required String jwtToken,
    required List<int> idList,
  }) async {
    try {
      final result = await request(
        callback: () => _catalogsClientDataSource.deleteCatalog(
            jwtToken: jwtToken, idList: idList.join(',')),
        dataMapper: EmptyGoodResponse.fromJson,
      );
      return getUseCaseResult(result);
    } catch (e) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }

  @override
  Future<UseCaseResult<CatalogsListResponseModel>> getCatalogs({
    required String jwtToken,
    required int offset,
    required int limit,
  }) async {
    try {
      final result = await request(
        callback: () => _catalogsClientDataSource.getCatalogs(
            offset: offset, limit: limit, jwtToken: jwtToken),
        dataMapper: CatalogsListResponseModel.fromJson,
      );

      return getUseCaseResult(result);
    } catch (e) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }
}
