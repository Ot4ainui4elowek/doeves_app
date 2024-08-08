abstract class CreateNotePageTransferObject {}

class CreateNoteTransferObject implements CreateNotePageTransferObject {
  const CreateNoteTransferObject(this.folderId);
  final int? folderId;
}

class OpenNoteTransferObject implements CreateNotePageTransferObject {
  const OpenNoteTransferObject(this.noteId);
  final int noteId;
}
