import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/rest_api_handler.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/authorization/data/model/http_status_and_errors.dart';
import 'package:doeves_app/feauture/create_note/domain/repository/create_note_repository.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/create_note_request_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/create_note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/remove_list_of_notes/empty_good_response.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/remove_list_of_notes/remove_notes_remote_response.dart';
import 'package:doeves_app/feauture/main_page/data/source/notes_data_source.dart';

class CreateNoteRepositoryImpl
    with RestApiHandler
    implements CreateNoteRepository {
  CreateNoteRepositoryImpl({required NotesClientDataSource data})
      : _data = data;
  final NotesClientDataSource _data;
  @override
  Future<UseCaseResult<IdResponseModel>> createNote({
    required CreateNoteRequestModel note,
    required String jwtToken,
  }) async {
    try {
      final result = await request(
        callback: () => _data.createNote(token: jwtToken, note: note),
        dataMapper: IdResponseModel.fromJson,
      );
      return getUseCaseResult(result);
    } catch (e) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }

  @override
  Future<UseCaseResult<RemoveNoteRemoteResponse>> deleteNote({
    required int id,
    required String jwtToken,
  }) async {
    try {
      final result = await request(
        callback: () => _data.deleteMultipleNotes(
          token: jwtToken,
          idList: id.toString(),
        ),
        dataMapper: RemoveNoteRemoteResponse.fromJson,
      );
      return getUseCaseResult(result);
    } catch (e) {
      return BadUseCaseResult(
          errorList: [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }

  @override
  Future<UseCaseResult<NoteResponseModel>> getNote(
      {required int id, required String jwtToken}) async {
    try {
      final result = await request(
        callback: () => _data.getNote(token: jwtToken, id: id),
        dataMapper: NoteResponseModel.fromJson,
      );
      return getUseCaseResult(result);
    } catch (e) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }

  @override
  Future<UseCaseResult<EmptyGoodResponse>> editDescription(
      {required int id,
      required String jwtToken,
      required String newDescription}) async {
    try {
      final result = await request(
          callback: () => _data.editDescription(
              token: jwtToken, id: id, newDescription: newDescription),
          dataMapper: EmptyGoodResponse.fromJson);
      return getUseCaseResult(result);
    } catch (e) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }

  @override
  Future<UseCaseResult<EmptyGoodResponse>> editTitle({
    required int id,
    required String jwtToken,
    required String newTitle,
  }) async {
    try {
      final result = await request(
          callback: () =>
              _data.editTitle(token: jwtToken, id: id, newTitle: newTitle),
          dataMapper: EmptyGoodResponse.fromJson);
      return getUseCaseResult(result);
    } catch (e) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }
}
