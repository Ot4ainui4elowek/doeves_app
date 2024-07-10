import 'package:doeves_app/core/presentation/text_fields/clear_text_field.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/tasks_list/task_list_item.dart';
import 'package:doeves_app/feauture/create_note/presentation/widgets/content_widget.dart';
import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required TaskListItem task,
    required void Function(int) deleteTask,
    required int index,
  })  : _index = index,
        _deleteTask = deleteTask,
        _task = task;
  final int _index;
  final TaskListItem _task;
  final void Function(int id) _deleteTask;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(_task),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) => _deleteTask(_task.id),
        child: ContentWidget(
          deleteContent: () => _deleteTask(_task.id),
          index: _index,
          contentBuilder: Stack(
            children: [
              Positioned(
                left: 0,
                child: _task.isSuccess.observer(
                  (context, successValue) => Checkbox(
                    value: successValue,
                    onChanged: (value) {
                      _task.isSuccess(!_task.isSuccess.value);
                      value = _task.isSuccess.value;
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 45,
                ),
                child: ClearTextField(
                  context: context,
                  focusNode: _task.focusNode,
                  controller: _task.text,
                ),
              ),
            ],
          ),
        ));
  }
}
