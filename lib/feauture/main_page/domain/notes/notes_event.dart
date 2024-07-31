part of 'notes_bloc.dart';

@freezed
abstract class UseCaseBlocEvent with _$UseCaseBlocEvent {
  factory UseCaseBlocEvent.fetchNotes({
    required UseCaseResult<List<NoteResponseModel>> result,
    required bool initialListIsEmpty,
  }) = FetchDataEvent;
  factory UseCaseBlocEvent.loadingNotes() = LoadingEvent;
  factory UseCaseBlocEvent.emptyResponse() = EmptyResponseEvent;
  factory UseCaseBlocEvent.resetToInitialState() = ResetToInitialStateEvent;
  factory UseCaseBlocEvent.clearState() = ClearStateEvent;
}
