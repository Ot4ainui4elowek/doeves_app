import 'package:doeves_app/feauture/login_page/data/model/authorization_remote_response/authorization_remote_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorResponseModel implements AuthorizationRemoteResponse {
  @JsonKey(name: 'path')
  final String path;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'status_code')
  final int statusCode;
  @JsonKey(name: 'date')
  final String date;
  ErrorResponseModel({
    required this.path,
    required this.message,
    required this.statusCode,
    required this.date,
  });
  static bool patternMatch(Map<String, dynamic> json) {
    return json.containsKey('path') &&
        json.containsKey('message') &&
        json.containsKey('status_code') &&
        json.containsKey('date');
  }

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorResponseModelToJson(this);
}
