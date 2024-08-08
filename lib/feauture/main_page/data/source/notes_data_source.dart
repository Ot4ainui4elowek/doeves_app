import 'package:dio/dio.dart';
import 'package:doeves_app/feauture/main_page/data/model/create_note_request_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/create_note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/note_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'notes_data_source.g.dart';

@RestApi(baseUrl: '')
abstract class NotesClientDataSource {
  factory NotesClientDataSource(Dio dio, {String baseUrl}) =
      _NotesClientDataSource;

  factory NotesClientDataSource.create({
    String? apiUrl,
  }) {
    final dio = Dio();
    if (apiUrl != null) {
      return NotesClientDataSource(dio, baseUrl: apiUrl);
    }
    return NotesClientDataSource(
      dio,
    );
  }

  @POST('/note')
  Future<HttpResponse<CreateNoteResponseModel>> createNote({
    @Header('Authorization') required String token,
    @Body() required CreateNoteRequestModel note,
  });

  @GET('/note/{id}')
  Future<HttpResponse<CreateNoteResponseModel>> getNote({
    @Header('Authorization') required String token,
    @Path('id') required int id,
  });

  @PATCH('/note/{id}/name')
  Future<HttpResponse<String>> editTitle({
    @Header('Authorization') required String token,
    @Path('id') required int id,
    @Query('val') required String newTitle,
  });

  @PATCH('/note/{id}/description')
  Future<HttpResponse<String>> editDescription({
    @Header('Authorization') required String token,
    @Path('id') required int id,
    @Query('val') required String newDescription,
  });

  @DELETE('/note/{listId}')
  Future<HttpResponse<String>> deleteMultipleNotes({
    @Header('Authorization') required String token,
    @Path('listId') required String idList,
  });

  @GET('/note/all')
  Future<HttpResponse<List<NoteResponseModel>>> getNotes({
    @Header('Authorization') required String token,
    @Query('offset') required int offset,
    @Query('limit') required int limit,
    @Query('including-catalogs') required bool includingCatalogs,
  });
}
