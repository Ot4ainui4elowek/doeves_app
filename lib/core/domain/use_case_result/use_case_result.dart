import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/feauture/authorization/data/model/authorization_remote_response/error_model.dart';

sealed class UseCaseResult<T> {
  bool get isSuccess;

  factory UseCaseResult({
    T? data,
    List<AppError>? errorList,
    ErrorResponseModel? errorData,
  }) {
    assert(((data == null) ^ (errorList == null)),
        'Data & error list can not be the same filled!');
    if (data != null) {
      return UseCaseResult.good(data);
    }
    if (errorList != null) {
      return UseCaseResult.bad(errorList, errorData: errorData);
    }

    throw Exception('Something went wrong with UseCaseResult arguments!');
  }

  const factory UseCaseResult.good(T data) = GoodUseCaseResult;

  factory UseCaseResult.bad(List<AppError> errorList,
          {ErrorResponseModel? errorData}) =>
      BadUseCaseResult(errorList: errorList, errorData: errorData);
}

class GoodUseCaseResult<T> implements UseCaseResult<T> {
  final T data;

  const GoodUseCaseResult(this.data);

  @override
  bool get isSuccess => true;
}

class BadUseCaseResult<T> implements UseCaseResult<T> {
  final List<AppError> errorList;
  final ErrorResponseModel? errorData;
  const BadUseCaseResult({required this.errorList, this.errorData});

  @override
  bool get isSuccess => false;
}

sealed class RestApiResult<T> {
  final int statusCode;

  const RestApiResult({
    required this.statusCode,
  });

  const factory RestApiResult.data({
    required final int statusCode,
    required final T data,
  }) = DataRestApiResult;

  const factory RestApiResult.error({
    required final int statusCode,
    required final List<AppError> errorList,
  }) = ErrorRestApiResult;
  const factory RestApiResult.errorWitchData({
    required final int statusCode,
    required final List<AppError> errorList,
    required final ErrorResponseModel errorData,
  }) = ErrorWitchDataRestApiResult;

  bool get isSuccess => switch (statusCode) {
        >= 200 && < 300 => true,
        _ => false,
      };
}

class DataRestApiResult<T> extends RestApiResult<T> {
  final T data;

  const DataRestApiResult({
    required super.statusCode,
    required this.data,
  });
}

class ErrorRestApiResult<T> extends RestApiResult<T> {
  final List<AppError> errorList;

  const ErrorRestApiResult({
    required super.statusCode,
    required this.errorList,
  });
}

class ErrorWitchDataRestApiResult<T> extends ErrorRestApiResult<T> {
  final ErrorResponseModel errorData;

  const ErrorWitchDataRestApiResult({
    required super.errorList,
    required super.statusCode,
    required this.errorData,
  });
}
