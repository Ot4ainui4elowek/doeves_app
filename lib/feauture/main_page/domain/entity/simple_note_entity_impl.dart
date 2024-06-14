import 'package:doeves_app/feauture/main_page/domain/entity/note_content_entity.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_entity.dart';

class SimpleNoteEntityImpl implements NoteEntity {
  SimpleNoteEntityImpl({
    required this.type,
    required this.title,
    required this.description,
    required this.dateOfLastEdit,
    required this.content,
  });

  @override
  final DateTime dateOfLastEdit;

  @override
  final String description;

  @override
  final String title;

  @override
  final String type;

  final List<NoteContentEntity> content;
}
