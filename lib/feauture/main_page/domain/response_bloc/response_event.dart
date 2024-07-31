part of 'response_bloc.dart';

@freezed
abstract class ResponseBlocEvent<T> with _$ResponseBlocEvent {
  factory ResponseBlocEvent.fetchNotes({
    required UseCaseResult<List<T>> result,
    required bool initialListIsEmpty,
  }) = FetchDataEvent;
  factory ResponseBlocEvent.loadingNotes() = LoadingEvent;
  factory ResponseBlocEvent.emptyResponse() = EmptyResponseEvent;
  factory ResponseBlocEvent.resetToInitialState() = ResetToInitialStateEvent;
  factory ResponseBlocEvent.clearState() = ClearStateEvent;
}
