import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_with_content/note_with_content_impl.dart';

abstract interface class NotesMockedRepository {
  Future<UseCaseResult<List<NoteWithContentImpl>>> getAllNotes(
      {required int ofest, required int limit});
  Future<UseCaseResult<NoteWithContentImpl>> addNote(
      {required String title, required String description});
  Future<UseCaseResult<String>> deleteNote({required int id});
}
