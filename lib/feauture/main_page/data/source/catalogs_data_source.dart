import 'package:dio/dio.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalog_request_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalog_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/create_note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/note_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'catalogs_data_source.g.dart';

@RestApi(baseUrl: '')
abstract class CatalogsClientDataSource {
  factory CatalogsClientDataSource(Dio dio, {String baseUrl}) =
      _CatalogsClientDataSource;

  factory CatalogsClientDataSource.create({
    String? apiUrl,
  }) {
    final dio = Dio();
    if (apiUrl != null) {
      return CatalogsClientDataSource(dio, baseUrl: apiUrl);
    }
    return CatalogsClientDataSource(
      dio,
    );
  }

  @POST('/catalog')
  Future<HttpResponse<IdResponseModel>> createCatalog({
    @Body() required CatalogRequestModel newCatalog,
    @Header('Authorization') required String jwtToken,
  });

  @GET('/catalog/all')
  Future<HttpResponse<List<CatalogResponseModel>>> getCatalogs({
    @Query('offset') required int offset,
    @Query('limit') required int limit,
    @Header('Authorization') required String jwtToken,
  });

  @DELETE('/catalog/{id}')
  Future<HttpResponse<String>> deleteCatalog({
    @Header('Authorization') required String jwtToken,
    @Path('id') required String idList,
  });

  @PATCH('/catalog/{id}/name')
  Future<HttpResponse<String>> editCatalogName({
    @Header('Authorization') required String jwtToken,
    @Path('id') required int id,
    @Query('val') required String catalogName,
  });

  @GET('/catalog/{id}/notes')
  Future<HttpResponse<List<NoteResponseModel>>> getNotesInCatalog({
    @Query('offset') required int offset,
    @Query('limit') required int limit,
    @Header('Authorization') required String jwtToken,
    @Path('id') required int id,
  });
}
