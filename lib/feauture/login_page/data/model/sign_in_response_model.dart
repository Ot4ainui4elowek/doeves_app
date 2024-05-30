import 'package:doeves_app/feauture/login_page/data/model/authorization_remote_response/authorization_remote_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response_model.g.dart';

@JsonSerializable()
class SignInResponseModel implements AuthorizationRemoteResponse {
  final String token;
  final UserDTO userDTO;
  const SignInResponseModel({required this.token, required this.userDTO});

  static bool patternMatch(Map<String, dynamic> json) {
    return json.containsKey('token') && json.containsKey('userDTO');
  }

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseModelToJson(this);
}

@JsonSerializable()
class UserDTO {
  final int id;
  final String email;
  final String role;

  UserDTO({required this.id, required this.email, required this.role});

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}
