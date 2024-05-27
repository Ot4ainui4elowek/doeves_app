import 'package:doeves_app/feauture/login_page/data/model/authorization_credentials.dart';

class AuthorizationCredentials {
  final String jwtToken;
  const AuthorizationCredentials(this.jwtToken);
  factory AuthorizationCredentials.fromModel(
          AuthorizationCredentialsModel model) =>
      AuthorizationCredentials(model.jwtToken);
}
