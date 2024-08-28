part of 'response_bloc.dart';

@freezed
class ResponseEvent with _$ResponseEvent {
  const factory ResponseEvent.fetch({
    required UseCaseResult result,
  }) = FetchEvent;
  const factory ResponseEvent.success() = SuccessEvent;
  const factory ResponseEvent.loading() = LoadingEvent;
}
