import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/authorization/data/model/sign_in_response_model.dart';
import 'package:doeves_app/feauture/authorization/data/model/sign_up_response_model.dart';

abstract class AuthorizationRepository {
  Future<UseCaseResult<SignInResponseModel>> signIn({
    required String email,
    required String password,
  });

  Future<UseCaseResult<SignUpResponseModel>> signUp({
    required String fullName,
    required String email,
    required String password,
    required String retypePassword,
  });
}
