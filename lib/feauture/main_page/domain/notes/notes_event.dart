part of 'notes_bloc.dart';

@freezed
abstract class NotesEvent with _$NotesEvent {
  factory NotesEvent.fetchNotes({
    required UseCaseResult<List<NoteWithContentImpl>> result,
  }) = FetchNotesEvent;
  factory NotesEvent.loadingNotes() = LoadingNotesEvent;
  factory NotesEvent.clearState() = ClearState;
}
