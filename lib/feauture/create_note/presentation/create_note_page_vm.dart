import 'package:doeves_app/feauture/create_note/domain/entity/add_content_button_widget_entity.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/create_content_entity.dart';
import 'package:doeves_app/feauture/create_note/presentation/content_list.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class CreateNotePageViewModel {
  CreateNotePageViewModel() {
    contentWidgetDatatList = [
      AddContentButtonWidgetEntity(
        icon: Icons.description,
        onPressed: _contentList.addTextContent,
        title: 'Add text',
      ),
      AddContentButtonWidgetEntity(
        icon: Icons.account_tree_rounded,
        onPressed: _contentList.addTaskListContent,
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

  final ContentList _contentList = ContentList();
  void deleteContent(int id) => _contentList.deleteContent(id);
  Rv<List<CreateContentEntity>> get contentList =>
      _contentList.contentListVariable;
}
