part of 'notes_bloc.dart';

@freezed
abstract class NotesState with _$NotesState {
  const factory NotesState.initial() = _Initial;
  const factory NotesState.loadingNotes() = _LoadingNotes;
  const factory NotesState.emptyState() = _EmptyState;
  const factory NotesState.error(AppError error) = _Error;
  const factory NotesState.emptyResponse() = _EmptyResult;
}
