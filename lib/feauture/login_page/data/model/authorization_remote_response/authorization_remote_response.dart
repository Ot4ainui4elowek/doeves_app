import 'package:doeves_app/feauture/login_page/data/model/authorization_remote_response/error_model.dart';
import 'package:doeves_app/feauture/login_page/data/model/sign_in_response_model.dart';

abstract class AuthorizationRemoteResponse {
  factory AuthorizationRemoteResponse.fromJson(Map<String, dynamic> json) {
    if (SignInResponseModel.patternMatch(json)) {
      return SignInResponseModel.fromJson(json);
    }
    if (ErrorResponseModel.patternMatch(json)) {
      return ErrorResponseModel.fromJson(json);
    } else {
      return throw Exception('suka blyat');
    }
  }
}
