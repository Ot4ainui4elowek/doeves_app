import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/login_page/domain/entity/authorization_credentrials.dart';

abstract class AuthorizationRepositoryForMockedData {
  Future<UseCaseResult<AuthorizationCredentials>> signIn({
    required String email,
    required String password,
  });

  Future<UseCaseResult<AuthorizationCredentials>> signUp({
    required String fullName,
    required String email,
    required String password,
    required String retypePassword,
  });
}
