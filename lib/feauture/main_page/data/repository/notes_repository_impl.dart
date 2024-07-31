import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/rest_api_handler.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/authorization/data/model/http_status_and_errors.dart';
import 'package:doeves_app/feauture/main_page/data/model/note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes_list/get_nptes_remote_response.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes_list/notes_list_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/remove_list_of_notes/remove_notes_remote_response.dart';
import 'package:doeves_app/feauture/main_page/data/source/notes_data_source.dart';
import 'package:doeves_app/feauture/main_page/domain/repository/notes_repository.dart';

class NotesRepositoryImpl with RestApiHandler implements NotesRepository {
  NotesRepositoryImpl({
    required NotesClientDataSource data,
  }) : _notesDataSourse = data;

  final NotesClientDataSource _notesDataSourse;

  @override
  Future<UseCaseResult<List<NoteResponseModel>>> getAllNotes({
    required int offset,
    required int limit,
    required bool includingCatalogs,
    required String jwtToken,
  }) async {
    try {
      final result = await request(
        callback: () => _notesDataSourse.getNotes(
            token: jwtToken,
            offset: offset,
            limit: limit,
            includingCatalogs: includingCatalogs),
        dataMapper: GetNotesRemoteResponse.fromJson,
      );
      switch (result) {
        case DataRestApiResult<GetNotesRemoteResponse>(:final data):
          {
            data as NotesListResponseModel;
            return GoodUseCaseResult((data.list));
          }
        case ErrorWitchDataRestApiResult<GetNotesRemoteResponse>(
            :final errorData
          ):
          {
            return DataBadUseCaseResult(errorData: errorData);
          }
        case ErrorRestApiResult<GetNotesRemoteResponse>(:final errorList):
          {
            return BadUseCaseResult(errorList: errorList);
          }
      }
    } catch (e) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }

  @override
  Future<UseCaseResult<RemoveNotesRemoteResponse>> deleteMultipleNotes(
      {required List<int> deleteNotesList, required String jwtToken}) async {
    try {
      final result = await request(
        callback: () => _notesDataSourse.deleteMultipleNotes(
            token: jwtToken, idList: deleteNotesList.join(',')),
        dataMapper: RemoveNotesRemoteResponse.fromJson,
      );
      switch (result) {
        case DataRestApiResult<RemoveNotesRemoteResponse>(:final data):
          {
            return UseCaseResult.good(data);
          }
        case ErrorWitchDataRestApiResult<RemoveNotesRemoteResponse>(
            :final errorData
          ):
          {
            return UseCaseResult.dataBad(errorData);
          }
        case ErrorRestApiResult<RemoveNotesRemoteResponse>(:final errorList):
          {
            return UseCaseResult.bad(errorList);
          }
      }
    } catch (e) {
      return BadUseCaseResult(
          errorList: [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }
}
