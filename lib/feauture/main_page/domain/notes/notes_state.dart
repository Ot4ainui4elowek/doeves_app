part of 'notes_bloc.dart';

@freezed
abstract class NotesState with _$NotesState {
  const factory NotesState.initial() = _Initial;
  const factory NotesState.loadingNotes() = _LoadingNotes;
  const factory NotesState.success() = _Success;
  const factory NotesState.error(AppError error) = _Error;
  const factory NotesState.emptyResult() = _EmptyResult;
}
