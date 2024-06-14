import 'package:doeves_app/feauture/main_page/domain/entity/note_content_types.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_image_content.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_text_content.dart';

abstract class NoteContentEntity {
  final NoteContentTypes type;
  const NoteContentEntity({required this.type});
  factory NoteContentEntity.fromJson(NoteContentEntity content) {
    switch (content.type) {
      case NoteContentTypes.text:
        content as NoteTextContent;
        return NoteTextContent(type: content.type, text: content.text);
      case NoteContentTypes.image:
        content as NoteImageContent;
        return NoteImageContent(type: content.type, imageUrl: content.imageUrl);
    }
  }
}
