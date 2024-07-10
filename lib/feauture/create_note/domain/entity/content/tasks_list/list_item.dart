import 'package:doeves_app/feauture/create_note/domain/entity/content/create_content_entity.dart';

abstract class ListItem implements CreateContentEntity {
  const ListItem(this.id);
  @override
  final int id;
}
