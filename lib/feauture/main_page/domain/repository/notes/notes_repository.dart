import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/notes_list/notes_list_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes/remove_list_of_notes/empty_good_response.dart';

abstract interface class NotesRepository {
  Future<UseCaseResult<NotesListResponseModel>> getAllNotes({
    required int offset,
    required int limit,
    required bool includingCatalogs,
    required String jwtToken,
  });

  Future<UseCaseResult<EmptyGoodResponse>> deleteMultipleNotes({
    required List<int> deleteNotesList,
    required String jwtToken,
  });

  Future<UseCaseResult<EmptyGoodResponse>> moveNote({
    required int noteId,
    required int? prevNoteId,
    required String jwtToken,
  });
}
