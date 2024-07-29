part of 'notes_bloc.dart';

@freezed
abstract class NotesEvent with _$NotesEvent {
  factory NotesEvent.fetchNotes({
    required UseCaseResult<List<NoteResponseModel>> result,
    required bool initialListIsEmpty,
  }) = FetchNotesEvent;
  factory NotesEvent.loadingNotes() = LoadingNotesEvent;
  factory NotesEvent.emptyResponse() = EmptyResponse;
  factory NotesEvent.resetToInitialState() = ResetToInitialState;
  factory NotesEvent.clearState() = ClearState;
}
