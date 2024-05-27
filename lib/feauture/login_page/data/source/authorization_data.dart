import 'package:doeves_app/core/data/remote_response.dart';
import 'package:doeves_app/feauture/login_page/data/model/authorization_credentials.dart';

abstract interface class AuthorizationDataSource {
  Future<RemoteResponse<AuthorizationCredentialsModel>> signIn({
    required final String email,
    required final String password,
  });
  Future<RemoteResponse<AuthorizationCredentialsModel>> signUp({
    required final String fullName,
    required final String email,
    required final String password,
  });
}
