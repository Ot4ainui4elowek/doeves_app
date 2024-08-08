import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/main_page/data/model/create_note_request_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/create_note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/remove_list_of_notes/empty_good_response.dart';
import 'package:doeves_app/feauture/main_page/data/model/remove_list_of_notes/remove_notes_remote_response.dart';

abstract interface class CreateNoteRepository {
  Future<UseCaseResult<CreateNoteResponseModel>> createNote({
    required CreateNoteRequestModel note,
    required String jwtToken,
  });

  Future<UseCaseResult<RemoveNoteRemoteResponse>> deleteNote({
    required int id,
    required String jwtToken,
  });

  Future<UseCaseResult<NoteResponseModel>> getNote({
    required int id,
    required String jwtToken,
  });

  Future<UseCaseResult<EmptyGoodResponse>> editTitle({
    required int id,
    required String jwtToken,
    required String newTitle,
  });

  Future<UseCaseResult<EmptyGoodResponse>> editDescription(
      {required int id,
      required String jwtToken,
      required String newDescription});
}
