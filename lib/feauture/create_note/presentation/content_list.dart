import 'package:doeves_app/feauture/create_note/domain/entity/content/create_content_entity.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/tasks_list/create_task_list_impl.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/tasks_list/task_list_item.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/text/create_text_content_impl.dart';
import 'package:reactive_variables/reactive_variables.dart';

class ContentList {
  void addTextContent() {
    _contentList.add(CreateTextContentImpl());
  }

  void addTaskListContent() {
    _contentList.add(CreateTasksListImpl([TaskListItem()]));
  }

  void deleteContent(int id) {
    _contentList.removeWhere((content) => content.id == id);
  }

  final Rv<List<CreateContentEntity>> _contentList = Rv([]);
  Rv<List<CreateContentEntity>> get contentListVariable => _contentList;
}
