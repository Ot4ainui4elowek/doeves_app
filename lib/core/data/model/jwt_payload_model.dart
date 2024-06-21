import 'package:json_annotation/json_annotation.dart';

part 'jwt_payload_model.g.dart';

@JsonSerializable()
class JwtPayloadModel {
  const JwtPayloadModel(
      {required this.scopes,
      required this.isVerified,
      required this.sub,
      required this.iat,
      required this.exp});
  final List<String> scopes;
  final bool isVerified;
  final String sub;
  final int iat;
  final int exp;
  factory JwtPayloadModel.fromJson(Map<String, dynamic> json) =>
      _$JwtPayloadModelFromJson(json);
  Map<String, dynamic> toJson() => _$JwtPayloadModelToJson(this);
}
