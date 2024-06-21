import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/rest_api_handler.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/authorization/data/model/http_status_and_errors.dart';
import 'package:doeves_app/feauture/authorization/data/model/sign_in_request_model.dart';
import 'package:doeves_app/feauture/authorization/data/model/sign_in_response_model.dart';
import 'package:doeves_app/feauture/authorization/data/model/sign_up_request_model.dart';
import 'package:doeves_app/feauture/authorization/data/model/sign_up_response_model.dart';
import 'package:doeves_app/feauture/authorization/data/source/authorization_client_data_source.dart';
import 'package:doeves_app/feauture/authorization/domain/repository/authorization_repository.dart';

class AuthorizationRepositoryImpl
    with RestApiHandler
    implements AuthorizationRepository {
  final AuthorizationClientDataSource _authorizationDataSource;
  AuthorizationRepositoryImpl({required authorizationDataSourse})
      : _authorizationDataSource = authorizationDataSourse;
  @override
  Future<UseCaseResult<SignInResponseModel>> signIn(
      {required String email, required String password}) async {
    try {
      final signInResponse = await request(
          callback: () => _authorizationDataSource
              .signIn(SignInRequestModel(email: email, password: password)),
          dataMapper: SignInResponseModel.fromJson);
      switch (signInResponse) {
        case DataRestApiResult<SignInResponseModel>(:final data):
          {
            return UseCaseResult.good(data);
          }
        case ErrorWitchDataRestApiResult<SignInResponseModel>(
            :final errorData,
            :final errorList
          ):
          {
            return UseCaseResult.bad(errorList, errorData: errorData);
          }
        case ErrorRestApiResult<SignInResponseModel>(:final errorList):
          {
            return UseCaseResult.bad(errorList);
          }
      }
    } catch (e) {
      return UseCaseResult.bad(
          [SpecificError(HttpStatusAndErrors.invalidRequest.value)]);
    }
  }

  @override
  Future<UseCaseResult<SignUpResponseModel>> signUp(
      {required String fullName,
      required String email,
      required String password,
      required String retypePassword}) async {
    if (password != retypePassword) {
      return UseCaseResult.bad([SpecificError('Password mismatch error')]);
    }
    try {
      final signUpResponse = await request(
          callback: () => _authorizationDataSource
              .signUp(SignUpRequestModel(email: email, password: password)),
          dataMapper: SignUpResponseModel.fromJson);
      switch (signUpResponse) {
        case DataRestApiResult<SignUpResponseModel>(:final data):
          {
            return UseCaseResult.good(data);
          }
        case ErrorWitchDataRestApiResult<SignUpResponseModel>(
            :final errorData,
            :final errorList
          ):
          {
            return UseCaseResult.bad(errorList, errorData: errorData);
          }
        case ErrorRestApiResult<SignUpResponseModel>(:final errorList):
          {
            return UseCaseResult.bad(errorList);
          }
      }
    } catch (e) {
      return UseCaseResult.bad(
        [
          SpecificError(HttpStatusAndErrors.invalidRequest.value),
        ],
      );
    }
  }
}
