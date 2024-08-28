import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/use_case_result/rest_api_handler.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/authorization/data/model/http_status_and_errors.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/notes_list/notes_list_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/remove_list_of_notes/empty_good_response.dart';
import 'package:doeves_app/feauture/main_page/data/source/notes_data_source.dart';
import 'package:doeves_app/feauture/main_page/domain/repository/notes/notes_repository.dart';

class NotesRepositoryImpl with RestApiHandler implements NotesRepository {
  NotesRepositoryImpl({
    required NotesClientDataSource data,
  }) : _notesDataSourse = data;

  final NotesClientDataSource _notesDataSourse;

  @override
  Future<UseCaseResult<NotesListResponseModel>> getAllNotes({
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
        dataMapper: NotesListResponseModel.fromJson,
      );
      return getUseCaseResult(result);
    } catch (e) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }

  @override
  Future<UseCaseResult<EmptyGoodResponse>> deleteMultipleNotes(
      {required List<int> deleteNotesList,
      required String jwtToken,
      bool? anywhere}) async {
    try {
      final result = await request(
        callback: () => _notesDataSourse.deleteMultipleNotes(
            token: jwtToken,
            idList: deleteNotesList.join(','),
            anywhere: anywhere),
        dataMapper: EmptyGoodResponse.fromJson,
      );
      return getUseCaseResult(result);
    } catch (e) {
      return BadUseCaseResult(
          errorList: [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }

  @override
  Future<UseCaseResult<EmptyGoodResponse>> moveNote({
    required int noteId,
    required int? prevNoteId,
    required String jwtToken,
  }) async {
    try {
      final result = await request(
          callback: () => _notesDataSourse.moveNote(
                token: jwtToken,
                noteId: noteId,
                prevNoteId: prevNoteId,
              ),
          dataMapper: EmptyGoodResponse.fromJson);

      return getUseCaseResult(result);
    } catch (e) {
      return BadUseCaseResult(
          errorList: [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }
}
