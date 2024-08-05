abstract class CreateNotePageTransferObject {}

class CreateNoteInFolderTransferObject implements CreateNotePageTransferObject {
  const CreateNoteInFolderTransferObject(this.folderId);
  final int folderId;
}

class OpenNoteTransferObject implements CreateNotePageTransferObject {
  const OpenNoteTransferObject(this.noteId);
  final int noteId;
}
