part of 'notes_bloc.dart';

@freezed
abstract class UseCaseBlocState with _$UseCaseBlocState {
  const factory UseCaseBlocState.initial() = _Initial;
  const factory UseCaseBlocState.loading() = _Loading;
  const factory UseCaseBlocState.emptyState() = _EmptyState;
  const factory UseCaseBlocState.error(AppError error) = _Error;
  const factory UseCaseBlocState.emptyResponse() = _EmptyResult;
}
