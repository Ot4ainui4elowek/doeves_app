import 'package:json_annotation/json_annotation.dart';

part 'authorization_credentials.g.dart';

@JsonSerializable()
class AuthorizationCredentialsModel {
  final String jwtToken;
  AuthorizationCredentialsModel({required this.jwtToken});
  factory AuthorizationCredentialsModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationCredentialsModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorizationCredentialsModelToJson(this);
}
