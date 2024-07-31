part of 'response_bloc.dart';

@freezed
abstract class ResponseBlocState with _$ResponseBlocState {
  const factory ResponseBlocState.initial() = _Initial;
  const factory ResponseBlocState.loading() = _Loading;
  const factory ResponseBlocState.emptyState() = _EmptyState;
  const factory ResponseBlocState.error(AppError error) = _Error;
  const factory ResponseBlocState.emptyResponse() = _EmptyResult;
}
