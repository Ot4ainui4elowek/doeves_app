import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/login_page/domain/entity/authorization_credentrials.dart';
import 'package:doeves_app/feauture/login_page/domain/repository/authorization_repository.dart';

abstract class AuthorizationStrategy {
  Future<UseCaseResult<AuthorizationCredentials>> call();
}

abstract class SignInStrategy implements AuthorizationStrategy {}

class SignInUsingEmailStrategy implements SignInStrategy {
  SignInUsingEmailStrategy({
    required this.authorizationRepository,
    required this.password,
    required this.email,
  });
  final AuthorizationRepository authorizationRepository;
  final String password;
  final String email;
  @override
  Future<UseCaseResult<AuthorizationCredentials>> call() async {
    return await authorizationRepository.signIn(
        email: email, password: password);
  }
}
