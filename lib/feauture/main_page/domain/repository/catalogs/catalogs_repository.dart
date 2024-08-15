import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalog_request_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalogs_list_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/create_note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/notes_list/notes_list_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/remove_list_of_notes/empty_good_response.dart';

abstract interface class CatalogsRepository {
  Future<UseCaseResult<CatalogsListResponseModel>> getCatalogs({
    required String jwtToken,
    required int offset,
    required int limit,
  });

  Future<UseCaseResult<IdResponseModel>> createCatalog({
    required CatalogRequestModel newCatalog,
    required String jwtToken,
  });

  Future<UseCaseResult<EmptyGoodResponse>> deleteCatalog({
    required String jwtToken,
    required String idList,
  });

  Future<UseCaseResult<EmptyGoodResponse>> editCatalogName({
    required String jwtToken,
    required String id,
    required String catalogName,
  });

  Future<UseCaseResult<NotesListResponseModel>> getNotesInCatalog({
    required int offset,
    required int limit,
    required String jwtToken,
  });
}
