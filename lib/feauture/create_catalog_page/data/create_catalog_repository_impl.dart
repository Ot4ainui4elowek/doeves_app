import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/use_case_result/rest_api_handler.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/authorization/data/model/http_status_and_errors.dart';
import 'package:doeves_app/feauture/create_catalog_page/domain/create_catalog_respository.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalog_request_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/create_note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/notes_list/notes_list_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/remove_list_of_notes/empty_good_response.dart';
import 'package:doeves_app/feauture/main_page/data/source/catalogs_data_source.dart';

class CreateCatalogRepositoryImpl
    with RestApiHandler
    implements CreateCatalogRepository {
  CreateCatalogRepositoryImpl(
      {required CatalogsClientDataSource catalogsClientDataSource})
      : _catalogsClientDataSource = catalogsClientDataSource;

  final CatalogsClientDataSource _catalogsClientDataSource;

  @override
  Future<UseCaseResult<NotesListResponseModel>> getNotesInCatalog({
    required int offset,
    required int limit,
    required String jwtToken,
    required int id,
  }) async {
    try {
      final result = await request(
        callback: () => _catalogsClientDataSource.getNotesInCatalog(
            offset: offset, limit: limit, jwtToken: jwtToken, id: id),
        dataMapper: NotesListResponseModel.fromJson,
      );
      return getUseCaseResult(result);
    } catch (e) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }

  @override
  Future<UseCaseResult<IdResponseModel>> createCatalog({
    required CatalogRequestModel newCatalog,
    required String jwtToken,
  }) async {
    try {
      final result = await request(
          callback: () => _catalogsClientDataSource.createCatalog(
              newCatalog: newCatalog, jwtToken: jwtToken),
          dataMapper: IdResponseModel.fromJson);

      return getUseCaseResult(result);
    } catch (e) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }

  @override
  Future<UseCaseResult<EmptyGoodResponse>> editCatalogName({
    required String jwtToken,
    required int id,
    required String catalogName,
  }) async {
    try {
      final result = await request(
        callback: () => _catalogsClientDataSource.editCatalogName(
            jwtToken: jwtToken, id: id, catalogName: catalogName),
        dataMapper: EmptyGoodResponse.fromJson,
      );
      return getUseCaseResult(result);
    } catch (e) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }
}
