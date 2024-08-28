part of 'list_response_bloc.dart';

@freezed
abstract class ListResponseBlocState with _$ListResponseBlocState {
  const factory ListResponseBlocState.initial() = _Initial;
  const factory ListResponseBlocState.loading() = _Loading;
  const factory ListResponseBlocState.emptyState() = _EmptyState;
  const factory ListResponseBlocState.error(AppError error) = _Error;
  const factory ListResponseBlocState.emptyResponse() = _EmptyResult;
}
