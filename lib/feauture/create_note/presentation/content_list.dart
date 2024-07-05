import 'package:doeves_app/feauture/create_note/domain/entity/content/create_content_entity.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/create_text_content_impl.dart';
import 'package:reactive_variables/reactive_variables.dart';

class ContentList {
  void addTextContent() {
    _contentList.add(CreateTextContentImpl());
  }

  void deleteContent(int id) {
    _contentList.removeWhere((content) => content.id == id);
  }

  final Rv<List<CreateContentEntity>> _contentList =
      [CreateTextContentImpl()].rv..clear();
  Rv<List<CreateContentEntity>> get contentListVariable => _contentList;
}
