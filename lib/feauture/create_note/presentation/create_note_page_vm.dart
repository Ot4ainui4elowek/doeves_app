import 'package:doeves_app/feauture/create_note/domain/entity/add_content_button_widget_entity.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/create_content_entity.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/tasks_list/create_task_list_impl.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/tasks_list/task_list_item.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/text/create_text_content_impl.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class CreateNotePageViewModel {
  CreateNotePageViewModel() {
    contentWidgetDatatList = [
      AddContentButtonWidgetEntity(
        icon: Icons.description,
        onPressed: _addTextContent,
        title: 'Add text',
      ),
      AddContentButtonWidgetEntity(
        icon: Icons.account_tree_rounded,
        onPressed: _addTaskListContent,
        title: 'Add tasks list',
      ),
      AddContentButtonWidgetEntity(
        icon: Icons.mic_rounded,
        onPressed: () {},
        title: 'Add voice',
      ),
    ];
  }
  late final List<AddContentButtonWidgetEntity> contentWidgetDatatList;

  void _addTextContent() {
    contentList.add(CreateTextContentImpl());
  }

  void _addTaskListContent() {
    contentList.add(CreateTasksListImpl([TaskListItem()]));
  }

  void deleteContent(int id) {
    contentList.removeWhere((content) => content.id == id);
  }

  final Rv<List<CreateContentEntity>> contentList = Rv([]);

  void onContentDrag({
    required int oldIndex,
    required int newIndex,
    required BuildContext context,
  }) {
    if (oldIndex < newIndex) {
      newIndex--;
    }
    final content = contentList.removeAt(oldIndex);
    contentList.value.insert(newIndex, content);
  }
}
