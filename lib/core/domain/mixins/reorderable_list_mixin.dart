import 'dart:developer';

import 'package:doeves_app/core/domain/id_model.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:reactive_variables/reactive_variables.dart';

abstract mixin class ReorderableListMixin {
  Future<UseCaseResult<D>> onReorder<D>({
    required int newIndex,
    required int oldIndex,
    required Future<UseCaseResult<D>> Function(int oldIndex, int? newIndex)
        callBack,
    required Rv<List<IdModel>> list,
  }) async {
    final requestNewIndex = newIndex - 1;

    if (oldIndex < newIndex) {
      newIndex--;
    }

    final oldId = list.value[oldIndex].id;
    final newId = requestNewIndex == -1 ? null : list.value[requestNewIndex].id;

    log('old: $oldId \nnew: $newId');

    final listObject = list.removeAt(oldIndex);

    list.value.insert(newIndex, listObject);

    final result = await callBack(oldId, newId);
    return result;
  }
}
