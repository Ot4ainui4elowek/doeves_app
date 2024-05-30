import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request_model.g.dart';

@JsonSerializable()
class SignInRequestModel {
  const SignInRequestModel({required this.email, required this.password});

  factory SignInRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestModelFromJson(json);

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;

  Map<String, dynamic> toJson() => _$SignInRequestModelToJson(this);
}
