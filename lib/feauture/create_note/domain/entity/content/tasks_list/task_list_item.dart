import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/tasks_list/list_item.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class TaskListItem implements ListItem {
  TaskListItem({required this.id});

  final Rv<bool> isSuccess = false.rv;

  final AppTextEditingController text = AppTextEditingController();

  final FocusNode focusNode = FocusNode();

  @override
  final int id;
}
