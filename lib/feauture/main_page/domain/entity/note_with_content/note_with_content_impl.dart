import 'package:doeves_app/feauture/main_page/domain/entity/note.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_with_content/content/content.dart';

class NoteWithContentImpl implements Note {
  NoteWithContentImpl({
    required this.title,
    required this.content,
  });
  @override
  final String title;
  final List<Content> content;
}
