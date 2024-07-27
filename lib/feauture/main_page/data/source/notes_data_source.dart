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
  factory NotesClientDataSource.createAmazon() => NotesClientDataSource(
        Dio(),
        baseUrl: 'http://ec2-35-175-251-233.compute-1.amazonaws.com/api/v1',
      );
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

  @GET('/note/all')
  Future<HttpResponse<List<NoteResponseModel>>> getNotes({
    @Header('Authorization') required String token,
    @Query('offset') required int offset,
    @Query('limit') required int limit,
    @Query('including-catalogs') required bool includingCatalogs,
  });
}
