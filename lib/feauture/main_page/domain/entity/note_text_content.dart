import 'package:doeves_app/feauture/main_page/domain/entity/note_content_entity.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_content_types.dart';

class NoteTextContent implements NoteContentEntity {
  NoteTextContent({
    required this.type,
    required this.text,
  });
  @override
  final NoteContentTypes type;
  final String text;
}
