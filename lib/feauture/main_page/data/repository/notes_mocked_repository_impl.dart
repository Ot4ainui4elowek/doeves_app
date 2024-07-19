import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/main_page/data/source/notes_mocked_data.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_with_content/note_with_content_impl.dart';
import 'package:doeves_app/feauture/main_page/domain/repository/notes_mocked_repository.dart';

class NotesMockedRepositoryImpl implements NotesMockedRepository {
  NotesMockedRepositoryImpl({required NotesMockedData data}) : _data = data;
  final NotesMockedData _data;

  @override
  Future<UseCaseResult<NoteWithContentImpl>> addNote(
      {required String title, required String description}) async {
    final result = await _data.addNote(title: title, description: description);
    switch (result) {
      case DataRestApiResult<NoteWithContentImpl>(:final data):
        {
          return GoodUseCaseResult(data);
        }
      case ErrorRestApiResult(:final errorList):
        {
          return BadUseCaseResult(errorList: errorList);
        }
      default:
        {
          return BadUseCaseResult(errorList: [SpecificError('oops!')]);
        }
    }
  }

  @override
  Future<UseCaseResult<String>> deleteNote({required int id}) async {
    final result = await _data.deleteNote(id: id);
    switch (result) {
      case DataRestApiResult<String>(:final data):
        {
          return GoodUseCaseResult(data);
        }
      case ErrorRestApiResult(:final errorList):
        {
          return BadUseCaseResult(errorList: errorList);
        }
      default:
        {
          return BadUseCaseResult(errorList: [SpecificError('oops!')]);
        }
    }
  }

  @override
  Future<UseCaseResult<List<NoteWithContentImpl>>> getAllNotes(
      {required int ofest, required int limit}) async {
    final result = await _data.getAllNotes(limit: limit, ofest: ofest);
    switch (result) {
      case DataRestApiResult<List<NoteWithContentImpl>>(:final data):
        {
          return GoodUseCaseResult(data);
        }
      case ErrorRestApiResult(:final errorList):
        {
          return BadUseCaseResult(errorList: errorList);
        }
      default:
        {
          return BadUseCaseResult(errorList: [SpecificError('oops!')]);
        }
    }
  }

  @override
  Future<UseCaseResult<String>> deleteMoreNotes(
      {required List<int> deletedList}) async {
    final result = await _data.deleteMoreNotes(deletedList: deletedList);
    switch (result) {
      case DataRestApiResult<String>(:final data):
        {
          return GoodUseCaseResult(data);
        }
      default:
        {
          return BadUseCaseResult(errorList: [SpecificError('oops!')]);
        }
    }
  }
}
