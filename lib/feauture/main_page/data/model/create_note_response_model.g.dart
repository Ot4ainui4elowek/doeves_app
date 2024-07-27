// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_note_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNoteResponseModel _$CreateNoteResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateNoteResponseModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      dateOfCreate: DateTime.parse(json['dateOfCreate'] as String),
    );

Map<String, dynamic> _$CreateNoteResponseModelToJson(
        CreateNoteResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'dateOfCreate': instance.dateOfCreate.toIso8601String(),
    };
