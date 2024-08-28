part of 'response_bloc.dart';

@freezed
class ResponseState with _$ResponseState {
  const factory ResponseState.initial() = _Initial;
  const factory ResponseState.loading() = _Loading;
  const factory ResponseState.error({
    required String message,
  }) = _Error;
}
