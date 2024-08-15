import 'package:json_annotation/json_annotation.dart';

part 'create_note_response_model.g.dart';

@JsonSerializable()
class IdResponseModel {
  IdResponseModel({
    required this.id,
  });

  factory IdResponseModel.fromJson(Map<String, dynamic> json) =>
      _$IdResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$IdResponseModelToJson(this);

  @JsonKey(name: 'id')
  final int id;
}
