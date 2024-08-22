import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalogs_list_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/remove_list_of_notes/empty_good_response.dart';

abstract interface class CatalogsRepository {
  Future<UseCaseResult<CatalogsListResponseModel>> getCatalogs({
    required String jwtToken,
    required int offset,
    required int limit,
  });

  Future<UseCaseResult<EmptyGoodResponse>> deleteCatalog({
    required String jwtToken,
    required List<int> idList,
  });
}
