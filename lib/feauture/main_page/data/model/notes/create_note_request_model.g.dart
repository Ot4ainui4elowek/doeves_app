// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_note_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNoteRequestModel _$CreateNoteRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateNoteRequestModel(
      name: json['name'] as String,
      description: json['description'] as String,
      catalogId: (json['catalog_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateNoteRequestModelToJson(
        CreateNoteRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'catalog_id': instance.catalogId,
    };
