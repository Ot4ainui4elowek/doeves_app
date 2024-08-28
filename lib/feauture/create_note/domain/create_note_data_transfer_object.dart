abstract class CreateNoteDataTransferObject {
  factory CreateNoteDataTransferObject.newNote(int? catalogId) =
      NewNoteTransferObject;
  factory CreateNoteDataTransferObject.openNote(int noteId) =
      OpenNoteTransferObject;
}

class NewNoteTransferObject implements CreateNoteDataTransferObject {
  const NewNoteTransferObject(this.catalogId);
  final int? catalogId;
}

class OpenNoteTransferObject implements CreateNoteDataTransferObject {
  const OpenNoteTransferObject(this.noteId);
  final int noteId;
}
