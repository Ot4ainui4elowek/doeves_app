enum NoteTransferAction {
  delete,
  add,
  edit;
}

class NoteTransferObject {
  const NoteTransferObject({
    required this.action,
    required this.id,
  });
  final NoteTransferAction action;
  final int id;
}
