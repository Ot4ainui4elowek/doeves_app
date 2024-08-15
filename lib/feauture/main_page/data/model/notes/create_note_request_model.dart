import 'package:json_annotation/json_annotation.dart';

part 'create_note_request_model.g.dart';

@JsonSerializable()
class CreateNoteRequestModel {
  CreateNoteRequestModel({
    required this.name,
    required this.description,
    this.catalogId,
  });

  factory CreateNoteRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateNoteRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateNoteRequestModelToJson(this);
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'catalog_id')
  final int? catalogId;
}
