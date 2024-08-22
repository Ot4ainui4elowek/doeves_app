// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteResponseModel _$NoteResponseModelFromJson(Map<String, dynamic> json) =>
    NoteResponseModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      dateOfCreate: DateTime.parse(json['date_of_create'] as String),
      catalog: json['catalog'] == null
          ? null
          : CatalogResponseModel.fromJson(
              json['catalog'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NoteResponseModelToJson(NoteResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'date_of_create': instance.dateOfCreate.toIso8601String(),
      'catalog': instance.catalog,
    };
