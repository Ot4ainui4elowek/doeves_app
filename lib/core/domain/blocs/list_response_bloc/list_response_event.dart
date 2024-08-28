part of 'list_response_bloc.dart';

@freezed
abstract class ListResponseBlocEvent<T> with _$ListResponseBlocEvent {
  factory ListResponseBlocEvent.fetch({
    required UseCaseResult<ListResponseModel<T>> result,
    required bool initialListIsEmpty,
  }) = FetchDataEvent;
  factory ListResponseBlocEvent.loading() = LoadingEvent;
  factory ListResponseBlocEvent.emptyResponse() = EmptyResponseEvent;
  factory ListResponseBlocEvent.resetToInitialState() =
      ResetToInitialStateEvent;
  factory ListResponseBlocEvent.clearState() = ClearStateEvent;

  factory ListResponseBlocEvent.error(String message) = ErrorEvent;
}
