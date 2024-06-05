import 'package:doeves_app/feauture/authorization/data/model/authorization_credentials.dart';

class AuthorizationCredentials {
  final String jwtToken;
  const AuthorizationCredentials(this.jwtToken);
  factory AuthorizationCredentials.fromModel(
          AuthorizationCredentialsModel model) =>
      AuthorizationCredentials(model.jwtToken);
}
