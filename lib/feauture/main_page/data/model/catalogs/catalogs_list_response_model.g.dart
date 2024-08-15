// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalogs_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogsListResponseModel _$CatalogsListResponseModelFromJson(
        Map<String, dynamic> json) =>
    CatalogsListResponseModel(
      (json['list'] as List<dynamic>)
          .map((e) => CatalogResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CatalogsListResponseModelToJson(
        CatalogsListResponseModel instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
