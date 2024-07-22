import 'dart:math';

import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/main_page/data/source/notes_mocked_data.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_with_content/note_with_content_impl.dart';
import 'package:reactive_variables/reactive_variables.dart';

class NotesMockedDataImpl implements NotesMockedData {
  final _notesList = Rv(List.generate(
    30,
    (index) => NoteWithContentImpl(
      content: [],
      description: 'descr $index',
      title: 'title $index',
      id: index,
    ),
  ));
  @override
  Future<RestApiResult<NoteWithContentImpl>> addNote(
      {required String title, required String description}) async {
    await Future.delayed(const Duration(seconds: 2));
    if (title.isNotEmpty && description.isNotEmpty) {
      final note = NoteWithContentImpl(
        content: [],
        description: description,
        title: title,
        id: Random().nextInt(100000),
      );
      _notesList.value.insert(
        0,
        note,
      );
      return RestApiResult.data(statusCode: 200, data: note);
    } else {
      return RestApiResult.error(
        statusCode: 411,
        errorList: [
          SpecificError('Title or description is empty!'),
        ],
      );
    }
  }

  @override
  Future<RestApiResult<String>> deleteNote({required int id}) async {
    await Future.delayed(const Duration(seconds: 2));
    final index = _notesList.value.indexWhere((note) => note.id == id);
    if (index == -1) {
      return RestApiResult.error(statusCode: 411, errorList: [
        SpecificError('Undefined note id!'),
      ]);
    } else {
      return const RestApiResult.data(
          statusCode: 200, data: 'note has been deleted!');
    }
  }

  @override
  Future<RestApiResult<List<NoteWithContentImpl>>> getAllNotes(
      {required int ofest, required int limit}) async {
    await Future.delayed(const Duration(seconds: 1));
    if (ofest < 0 || limit < 0 || ofest > _notesList.length || limit > 20) {
      return RestApiResult.error(statusCode: 411, errorList: [
        SpecificError(
            ' 	The server refuses to accept the request without a defined Content- Length.')
      ]);
    } else {
      List<NoteWithContentImpl> data = [];
      if (ofest + limit >= _notesList.length) {
        limit = _notesList.length - ofest;
      }
      if (ofest != _notesList.length) {
        data = _notesList.value.sublist(ofest, ofest + limit);
      }
      return RestApiResult.data(
        statusCode: 200,
        data: data,
      );
    }
  }

  @override
  Future<RestApiResult<String>> deleteMoreNotes(
      {required List<int> deletedList}) async {
    await Future.delayed(const Duration(seconds: 2));
    _notesList.removeWhere((note) => deletedList.contains(note.id));
    return const RestApiResult.data(
        statusCode: 200, data: 'notes has been deleted!');
  }

  @override
  Future<RestApiResult<String>> moveNote(
      {required int oldId, required int newId}) async {
    await Future.delayed(const Duration(seconds: 2));
    final oldIndex = _notesList.value.indexWhere((note) => note.id == oldId);
    int newIndex = _notesList.value.indexWhere((note) => note.id == newId);
    if (oldIndex == newIndex) {
      return const RestApiResult.data(statusCode: 200, data: 'old == new');
    }
    if (oldIndex < 0 ||
        oldIndex >= _notesList.length ||
        newIndex < 0 ||
        newIndex >= _notesList.length) {
      return RestApiResult.error(
          statusCode: 400, errorList: [SpecificError('undefined indexes')]);
    }
    if (oldIndex < newIndex) {
      newIndex--;
    }

    final note = _notesList.removeAt(oldIndex);

    _notesList.value.insert(newIndex, note);

    return RestApiResult.data(statusCode: 200, data: 'note move to $newIndex');
  }
}
