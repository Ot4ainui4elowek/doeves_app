import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_with_content/note_with_content_impl.dart';

abstract interface class NotesMockedData {
  Future<RestApiResult<List<NoteWithContentImpl>>> getAllNotes(
      {required int ofest, required int limit});
  Future<RestApiResult<NoteWithContentImpl>> addNote(
      {required String title, required String description});
  Future<RestApiResult<String>> deleteNote({required int id});
  Future<RestApiResult<String>> deleteMoreNotes(
      {required List<int> deletedList});
  Future<RestApiResult<String>> moveNote(
      {required int oldId, required int newId});
}
