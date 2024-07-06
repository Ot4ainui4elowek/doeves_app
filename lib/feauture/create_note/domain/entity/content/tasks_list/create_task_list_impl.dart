import 'dart:math';

import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/create_content_entity.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/tasks_list/task_list_item.dart';
import 'package:reactive_variables/reactive_variables.dart';

class CreateTasksListImpl extends Rv<List<TaskListItem>>
    implements CreateContentEntity {
  final AppTextEditingController listTitle = AppTextEditingController();

  CreateTasksListImpl(super.value) {
    id = Random().nextInt(1000);
  }
  @override
  late final int id;
}
