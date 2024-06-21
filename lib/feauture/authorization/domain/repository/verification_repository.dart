import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/authorization/data/model/verification_response_model.dart';

abstract class VerificationRepository {
  Future<UseCaseResult<VerificationResponseModel>> sendVerificationCode({
    required int code,
    required String jwtToken,
  });
  Future<UseCaseResult<VerificationResponseModel>> resendVerificationCode(
      String jwtToken);
}
