import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  const SignUpResponseModel({required this.id, required this.message});
  final int id;
  final String message;
  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
  static bool patternMatch(Map<String, dynamic> json) {
    return json.containsKey('id') && json.containsKey('message');
  }
}
