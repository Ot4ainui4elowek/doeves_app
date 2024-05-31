import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/login_page/data/model/sign_in_response_model.dart';
import 'package:doeves_app/feauture/login_page/data/model/sign_up_response_model.dart';
import 'package:doeves_app/feauture/login_page/domain/repository/authorization_repository.dart';

abstract class SignInStrategy {
  Future<UseCaseResult<SignInResponseModel>> call();
}

abstract class SignUpStrategy {
  Future<UseCaseResult<SignUpResponseModel>> call();
}

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
  Future<UseCaseResult<SignInResponseModel>> call() async {
    return await authorizationRepository.signIn(
        email: email, password: password);
  }
}

class SignUpUsingEmailStrategy implements SignUpStrategy {
  SignUpUsingEmailStrategy(
    this.authorizationRepository, {
    required this.fullName,
    required this.email,
    required this.password,
    required this.retypePassword,
  });
  final String email;
  final String password;
  final String retypePassword;
  final String fullName;
  final AuthorizationRepository authorizationRepository;
  @override
  Future<UseCaseResult<SignUpResponseModel>> call() async {
    return await authorizationRepository.signUp(
        fullName: fullName,
        email: email,
        password: password,
        retypePassword: retypePassword);
  }
}
