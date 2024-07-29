import 'package:dio/dio.dart';
import 'package:doeves_app/core/data/remote_response.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/authorization/data/model/authorization_remote_response/error_model.dart';
import 'package:doeves_app/feauture/authorization/data/model/http_status_and_errors.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/dio.dart';

import 'app_error/app_error.dart';

abstract mixin class RestApiHandler {
  @protected
  Future<RestApiResult<D>> request<R, D>({
    required final Future<HttpResponse<R>> Function() callback,
    required final D Function(JsonType json) dataMapper,
  }) async {
    return _request(callback: callback, dataMapper: dataMapper);
  }

  @protected
  Future<RestApiResult<D>> requestWithListDataMapper<R, D>({
    required final Future<HttpResponse<R>> Function() callback,
    required final D Function(List<dynamic> json)? listDataMapper,
  }) async {
    return _request(callback: callback, listDataMapper: listDataMapper);
  }

  @protected
  Future<RestApiResult<D>> _request<R, D>({
    required final Future<HttpResponse<R>> Function() callback,
    final D Function(JsonType json)? dataMapper,
    final D Function(List<dynamic> json)? listDataMapper,
  }) async {
    if ((dataMapper == null) == (listDataMapper == null)) {
      return RestApiResult.error(
        statusCode: -1,
        errorList: [SpecificError('data mapper error')],
      );
    }

    try {
      final HttpResponse(:response) = await callback();
      final Response(:data, :statusCode) = response;
      switch (statusCode!) {
        case >= 200 && < 300:
          {
            final dataFromJson =
                dataMapper == null ? listDataMapper!(data) : dataMapper(data);
            return RestApiResult.data(
                statusCode: statusCode, data: dataFromJson);
          }

        default:
          {
            return RestApiResult.error(
              errorList: [
                SpecificError(HttpStatusAndErrors.unableStatus.value),
              ],
              statusCode: statusCode,
            );
          }
      }
    } on DioException catch (error) {
      final res = error.response;
      if (res != null && res.statusCode != null) {
        switch (res.statusCode!) {
          case > 300 && < 500:
            {
              late final ErrorResponseModel errorResponce;
              if (ErrorResponseModel.patternMatch(res.data)) {
                errorResponce = ErrorResponseModel.fromJson(res.data);
              }
              return RestApiResult.errorWitchData(
                errorData: errorResponce,
                statusCode: res.statusCode!,
              );
            }
          case >= 500:
            {
              return RestApiResult.error(
                errorList: [SpecificError(HttpStatusAndErrors.e500.value)],
                statusCode: res.statusCode!,
              );
            }
          default:
            {
              return RestApiResult.error(
                errorList: [
                  SpecificError(HttpStatusAndErrors.unableStatus.value)
                ],
                statusCode: res.statusCode!,
              );
            }
        }
      } else {
        return RestApiResult.error(
          errorList: [
            SpecificError(HttpStatusAndErrors.unknownException.value)
          ],
          statusCode: -1,
        );
      }
    } catch (e) {
      return RestApiResult.error(
        statusCode: -1,
        errorList: [SpecificError(HttpStatusAndErrors.handlerException.value)],
      );
    }
  }
}
