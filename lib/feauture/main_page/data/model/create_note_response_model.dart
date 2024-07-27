import 'package:json_annotation/json_annotation.dart';

part 'create_note_response_model.g.dart';

@JsonSerializable()
class CreateNoteResponseModel {
  CreateNoteResponseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.dateOfCreate,
  });

  factory CreateNoteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateNoteResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateNoteResponseModelToJson(this);

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'dateOfCreate')
  final DateTime dateOfCreate;
}
