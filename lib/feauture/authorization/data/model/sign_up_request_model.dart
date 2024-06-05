import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_model.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  const SignUpRequestModel({required this.email, required this.password});
  final String email;
  final String password;
  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}
