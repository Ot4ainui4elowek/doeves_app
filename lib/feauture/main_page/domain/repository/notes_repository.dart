import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/main_page/data/model/note_response_model.dart';

abstract interface class NotesRepository {
  Future<UseCaseResult<List<NoteResponseModel>>> getAllNotes({
    required int offset,
    required int limit,
    required bool includingCatalogs,
    required String jwtToken,
  });
}
