import 'package:doeves_app/feauture/main_page/domain/entity/note_content_entity.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_content_types.dart';

class NoteImageContent implements NoteContentEntity {
  const NoteImageContent({
    required this.type,
    required this.imageUrl,
  });
  @override
  final NoteContentTypes type;
  final String imageUrl;
}
