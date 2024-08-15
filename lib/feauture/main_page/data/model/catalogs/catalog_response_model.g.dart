// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogResponseModel _$CatalogResponseModelFromJson(
        Map<String, dynamic> json) =>
    CatalogResponseModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      dateOfCreate: json['dateOfCreate'] == null
          ? null
          : DateTime.parse(json['dateOfCreate'] as String),
    );

Map<String, dynamic> _$CatalogResponseModelToJson(
        CatalogResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dateOfCreate': instance.dateOfCreate?.toIso8601String(),
    };
