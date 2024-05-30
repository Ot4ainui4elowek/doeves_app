import 'package:doeves_app/core/data/model/rest_api_error_model.dart';
import 'package:doeves_app/core/data/remote_response.dart';
import 'package:doeves_app/feauture/login_page/data/model/authorization_credentials.dart';
import 'package:doeves_app/feauture/login_page/data/source/authorization_data_for_mocked_data.dart';

class AuthorizationMockedDataSource
    implements AuthorizationDataSourceForMockedData {
  @override
  Future<RemoteResponse<AuthorizationCredentialsModel>> signIn(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 5));
    if (email.isNotEmpty && password.length > 12) {
      return DataRemoteResponse(
        data: AuthorizationCredentialsModel(
          jwtToken: 'DKJFJ4hwurJR#Ejd.JEHRU#4rkmdkfdgjhgfr.KNFUOE#(@I#WYR743',
        ),
      );
    } else {
      return ErrorRemoteResponse(
        title: 'sign in error',
        detail: 'wrong email adress or password',
        errorList: [
          RestApiValidationErrorModel(
            fieldName: 'email',
            errorList: [
              (code: 'email is wrong', params: null),
            ],
          ),
          RestApiValidationErrorModel(
            fieldName: 'password',
            errorList: [
              (code: 'password is wrong', params: null),
            ],
          ),
        ],
      );
    }
  }

  @override
  Future<RemoteResponse<AuthorizationCredentialsModel>> signUp(
      {required String fullName,
      required String email,
      required String password}) async {
    await Future.delayed(const Duration(seconds: 5));
    if (email.isNotEmpty && password.length > 9 && fullName.length > 4) {
      return DataRemoteResponse(
          data: AuthorizationCredentialsModel(
              jwtToken:
                  'DKJFJ4hwurJR#Ejd.JEHRU#4rkmdkfdgjhgfr.KNFUOE#(@I#WYR743'));
    } else {
      return ErrorRemoteResponse(
        title: 'sign up error',
        detail: 'wrong email adress or password or full name',
        errorList: [
          RestApiValidationErrorModel(
            fieldName: 'email',
            errorList: [
              (code: 'email is wrong', params: null),
            ],
          ),
          RestApiValidationErrorModel(
            fieldName: 'password',
            errorList: [
              (code: 'password is wrong', params: null),
            ],
          ),
          RestApiValidationErrorModel(
            fieldName: 'full name',
            errorList: [
              (code: 'full name is wrong', params: null),
            ],
          ),
        ],
      );
    }
  }
}
