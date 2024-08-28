import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/use_case_result/rest_api_handler.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/authorization/data/model/http_status_and_errors.dart';
import 'package:doeves_app/feauture/authorization/data/model/verification_response_model.dart';
import 'package:doeves_app/feauture/authorization/data/source/authorization_client_data_source.dart';
import 'package:doeves_app/feauture/authorization/domain/repository/verification_repository.dart';

class VerificationRepositoryImpl
    with RestApiHandler
    implements VerificationRepository {
  VerificationRepositoryImpl(
      {required AuthorizationClientDataSource dataSourse})
      : _dataSource = dataSourse;
  final AuthorizationClientDataSource _dataSource;
  @override
  Future<UseCaseResult<VerificationResponseModel>> resendVerificationCode(
      String jwtToken) async {
    try {
      final result = await request(
          callback: () => _dataSource.resendVerificationCode(jwtToken),
          dataMapper: VerificationResponseModel.fromJson);

      return getUseCaseResult(result);
    } catch (e) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }

  @override
  Future<UseCaseResult<VerificationResponseModel>> sendVerificationCode(
      {required int code, required String jwtToken}) async {
    try {
      final result = await request(
          callback: () => _dataSource.sendVerificationCode(jwtToken, code),
          dataMapper: VerificationResponseModel.fromJson);

      return getUseCaseResult(result);
    } catch (e) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }
}
