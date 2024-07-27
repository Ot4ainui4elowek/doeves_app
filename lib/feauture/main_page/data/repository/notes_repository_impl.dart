import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/rest_api_handler.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/authorization/data/model/http_status_and_errors.dart';
import 'package:doeves_app/feauture/main_page/data/model/note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/source/notes_data_source.dart';
import 'package:doeves_app/feauture/main_page/domain/repository/notes_repository.dart';

class NotesRepositoryImpl with RestApiHandler implements NotesRepository {
  NotesRepositoryImpl({
    required this.data,
  });

  final NotesClientDataSource data;

  List<NoteResponseModel> _noteListDataMaper(List<dynamic> json) {
    return json.map((note) => NoteResponseModel.fromJson(note)).toList();
  }

  @override
  Future<UseCaseResult<List<NoteResponseModel>>> getAllNotes(
      {required int offset,
      required int limit,
      required bool includingCatalogs,
      required String jwtToken}) async {
    try {
      final result = await request(
        callback: () => data.getNotes(
            token: jwtToken,
            offset: offset,
            limit: limit,
            includingCatalogs: includingCatalogs),
        listDataMapper: _noteListDataMaper,
      );
      switch (result) {
        case DataRestApiResult<List<NoteResponseModel>>(:final data):
          {
            return GoodUseCaseResult(data);
          }
        case ErrorWitchDataRestApiResult<List<NoteResponseModel>>(
            :final errorData
          ):
          {
            return DataBadUseCaseResult(errorData: errorData);
          }
        case ErrorRestApiResult<List<NoteResponseModel>>(:final errorList):
          {
            return BadUseCaseResult(errorList: errorList);
          }
      }
    } catch (e) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }
}
