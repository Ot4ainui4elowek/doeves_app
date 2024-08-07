import 'package:json_annotation/json_annotation.dart';

part 'create_note_response_model.g.dart';

@JsonSerializable()
class CreateNoteResponseModel {
  CreateNoteResponseModel({
    required this.id,
  });

  factory CreateNoteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateNoteResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateNoteResponseModelToJson(this);

  @JsonKey(name: 'id')
  final int id;
}
