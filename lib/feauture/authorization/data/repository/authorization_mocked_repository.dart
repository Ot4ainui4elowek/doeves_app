import 'package:doeves_app/core/data/remote_response.dart';
import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/authorization/data/model/authorization_credentials.dart';
import 'package:doeves_app/feauture/authorization/data/source/authorization_data_for_mocked_data.dart';
import 'package:doeves_app/feauture/authorization/domain/entity/authorization_credentrials.dart';
import 'package:doeves_app/feauture/authorization/domain/repository/authorization_repository_for_mocked_data.dart';
import 'package:doeves_app/util/rest_api_error_list_ext.dart';

class AuthorizationMockedRepository
    implements AuthorizationRepositoryForMockedData {
  final AuthorizationDataSourceForMockedData _authorizationData;
  AuthorizationMockedRepository({required authorizationData})
      : _authorizationData = authorizationData;
  @override
  Future<UseCaseResult<AuthorizationCredentials>> signIn(
      {required String email, required String password}) async {
    final soucreResult =
        await _authorizationData.signIn(email: email, password: password);
    return switch (soucreResult) {
      DataRemoteResponse<AuthorizationCredentialsModel>(:final data) =>
        UseCaseResult.good(AuthorizationCredentials.fromModel(data)),
      VoidRemoteResponse<AuthorizationCredentialsModel>() =>
        UseCaseResult.bad([const SelfValidationError('unexpected void')]),
      ErrorRemoteResponse<AuthorizationCredentialsModel>(:final errorList) =>
        UseCaseResult.bad(errorList.asAppErrors.toList()),
    };
  }

  @override
  Future<UseCaseResult<AuthorizationCredentials>> signUp(
      {required String fullName,
      required String email,
      required String password,
      required String retypePassword}) async {
    final soucreResult = await _authorizationData.signUp(
        fullName: fullName, email: email, password: password);
    return switch (soucreResult) {
      DataRemoteResponse<AuthorizationCredentialsModel>(:final data) =>
        UseCaseResult.good(AuthorizationCredentials.fromModel(data)),
      VoidRemoteResponse<AuthorizationCredentialsModel>() =>
        UseCaseResult.bad([const SelfValidationError('unexpected void')]),
      ErrorRemoteResponse<AuthorizationCredentialsModel>(:final errorList) =>
        UseCaseResult.bad(errorList.asAppErrors.toList()),
    };
  }
}
