import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/rest_api_handler.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/authorization/data/model/http_status_and_errors.dart';
import 'package:doeves_app/feauture/create_note/domain/create_note_repository.dart';
import 'package:doeves_app/feauture/main_page/data/model/create_note_request_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/create_note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/remove_list_of_notes/remove_notes_remote_response.dart';
import 'package:doeves_app/feauture/main_page/data/source/notes_data_source.dart';

class CreateNoteRepositoryImpl
    with RestApiHandler
    implements CreateNoteRepository {
  CreateNoteRepositoryImpl({required NotesClientDataSource data})
      : _data = data;
  final NotesClientDataSource _data;
  @override
  Future<UseCaseResult<CreateNoteResponseModel>> createNote({
    required CreateNoteRequestModel note,
    required String jwtToken,
  }) async {
    try {
      final result = await request(
        callback: () => _data.createNote(token: jwtToken, note: note),
        dataMapper: CreateNoteResponseModel.fromJson,
      );

      switch (result) {
        case DataRestApiResult<CreateNoteResponseModel>(:final data):
          {
            return UseCaseResult.good(data);
          }
        case ErrorRestApiResult<CreateNoteResponseModel>(:final errorList):
          {
            return UseCaseResult.bad(errorList);
          }
        case ErrorWitchDataRestApiResult<CreateNoteResponseModel>(
            :final errorData
          ):
          {
            return UseCaseResult.dataBad(errorData);
          }
      }
    } catch (e) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }

  @override
  Future<UseCaseResult<RemoveNotesRemoteResponse>> deleteNote({
    required int id,
    required String jwtToken,
  }) async {
    try {
      final result = await request(
        callback: () => _data.deleteMultipleNotes(
          token: jwtToken,
          idList: id.toString(),
        ),
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

  @override
  Future<UseCaseResult<CreateNoteResponseModel>> getNote(
      {required int id, required String jwtToken}) async {
    try {
      final result = await request(
        callback: () => _data.getNote(token: jwtToken, id: id),
        dataMapper: CreateNoteResponseModel.fromJson,
      );

      switch (result) {
        case DataRestApiResult<CreateNoteResponseModel>(:final data):
          {
            return UseCaseResult.good(data);
          }
        case ErrorRestApiResult<CreateNoteResponseModel>(:final errorList):
          {
            return UseCaseResult.bad(errorList);
          }
        case ErrorWitchDataRestApiResult<CreateNoteResponseModel>(
            :final errorData
          ):
          {
            return UseCaseResult.dataBad(errorData);
          }
      }
    } catch (e) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }
}
