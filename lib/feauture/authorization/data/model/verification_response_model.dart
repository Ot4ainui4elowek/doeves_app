import 'package:json_annotation/json_annotation.dart';

part 'verification_response_model.g.dart';

@JsonSerializable()
class VerificationResponseModel {
  const VerificationResponseModel(this.message);
  final String message;
  factory VerificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationResponseModelToJson(this);
}
