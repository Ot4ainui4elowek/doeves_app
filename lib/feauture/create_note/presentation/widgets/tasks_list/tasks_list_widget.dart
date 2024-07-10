import 'dart:math';

import 'package:doeves_app/core/presentation/app_divider.dart';
import 'package:doeves_app/core/presentation/text_fields/clear_text_field.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/tasks_list/create_task_list_impl.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/tasks_list/task_list_item.dart';
import 'package:doeves_app/feauture/create_note/presentation/widgets/tasks_list/task_widget.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class TaskListContentWidget extends StatelessWidget {
  const TaskListContentWidget(this.tasksList, {super.key});
  final CreateTasksListImpl tasksList;

  Widget _addButtonBuilder(BuildContext context) => OutlinedButton(
        onPressed: () {
          tasksList.add(TaskListItem(id: Random().nextInt(10000)));
        },
        style: ButtonStyle(
            shape: const WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
            ),
            side: WidgetStatePropertyAll(
                BorderSide(color: Theme.of(context).colorScheme.outline)),
            padding: const WidgetStatePropertyAll(EdgeInsets.all(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.add,
            ),
            Text(
              'Add task',
              style: AppTextTheme.textBase(weight: TextWeight.medium),
            ),
            const SizedBox(height: 0),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          ClearTextField(
            context: context,
            controller: tasksList.listTitle,
            hintText: 'This is a list of something...',
            textStyle:
                AppTextTheme.textBase(weight: TextWeight.medium).copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          tasksList.observer(
            (context, value) => ReorderableListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              buildDefaultDragHandles: false,
              onReorder: (oldIndex, newIndex) => tasksList.onTaskDrag(
                  context: context, oldIndex: oldIndex, newIndex: newIndex),
              shrinkWrap: true,
              itemBuilder: (context, index) => ReorderableDragStartListener(
                index: index,
                enabled: false,
                key: ValueKey(value[index]),
                child: TaskWidget(
                  index: index,
                  task: value[index],
                  deleteTask: tasksList.deleteTask,
                ),
              ),
              itemCount: value.length,
            ),
          ),
          AppDivider(
            context: context,
            height: 25,
          ),
          _addButtonBuilder(context),
        ],
      ),
    );
  }
}
