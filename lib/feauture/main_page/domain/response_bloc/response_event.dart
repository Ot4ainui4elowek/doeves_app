part of 'response_bloc.dart';

@freezed
abstract class ResponseBlocEvent<T> with _$ResponseBlocEvent {
  factory ResponseBlocEvent.fetch({
    required UseCaseResult<ListResponseModel<T>> result,
    required bool initialListIsEmpty,
  }) = FetchDataEvent;
  factory ResponseBlocEvent.loading() = LoadingEvent;
  factory ResponseBlocEvent.emptyResponse() = EmptyResponseEvent;
  factory ResponseBlocEvent.resetToInitialState() = ResetToInitialStateEvent;
  factory ResponseBlocEvent.clearState() = ClearStateEvent;

  factory ResponseBlocEvent.error(String message) = ErrorEvent;
}
