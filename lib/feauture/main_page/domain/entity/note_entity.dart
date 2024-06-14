abstract class NoteEntity {
  final String type;
  final String title;
  final String description;
  final DateTime dateOfLastEdit;
  NoteEntity({
    required this.type,
    required this.title,
    required this.description,
    required this.dateOfLastEdit,
  });
}
