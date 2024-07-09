import 'dart:math';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/create_content_entity.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/tasks_list/task_list_item.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class CreateTasksListImpl extends Rv<List<TaskListItem>>
    implements CreateContentEntity {
  final AppTextEditingController listTitle = AppTextEditingController();

  CreateTasksListImpl(super.value) {
    id = Random().nextInt(1000);
  }

  void deleteTask(JWT id) {
    removeWhere((task) => task.id == id);
  }

  void onTaskDrag({
    required int oldIndex,
    required int newIndex,
    required BuildContext context,
  }) {
    if (oldIndex < newIndex) {
      newIndex--;
    }
    final content = removeAt(oldIndex);
    value.insert(newIndex, content);
  }

  @override
  late final int id;
}
