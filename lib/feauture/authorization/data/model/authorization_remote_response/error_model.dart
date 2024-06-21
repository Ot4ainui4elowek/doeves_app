import 'package:doeves_app/feauture/authorization/data/model/authorization_remote_response/authorization_remote_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorResponseModel implements AuthorizationRemoteResponse {
  @JsonKey(name: 'path')
  final String path;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'status_code')
  final int statusCode;
  @JsonKey(name: 'date')
  final String date;
  ErrorResponseModel({
    required this.path,
    required this.content,
    required this.statusCode,
    required this.date,
  });
  static bool patternMatch(Map<String, dynamic> json) {
    return json.containsKey('path') &&
        json.containsKey('content') &&
        json.containsKey('status_code') &&
        json.containsKey('date');
  }

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorResponseModelToJson(this);
}
