import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/main_page/data/model/note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/remove_list_of_notes/remove_notes_remote_response.dart';

abstract interface class NotesRepository {
  Future<UseCaseResult<List<NoteResponseModel>>> getAllNotes({
    required int offset,
    required int limit,
    required bool includingCatalogs,
    required String jwtToken,
  });

  Future<UseCaseResult<RemoveNoteRemoteResponse>> deleteMultipleNotes({
    required List<int> deleteNotesList,
    required String jwtToken,
  });

  @override
  Future<UseCaseResult<NoteResponseModel>> getNote(
      {required int id, required String jwtToken});
}
