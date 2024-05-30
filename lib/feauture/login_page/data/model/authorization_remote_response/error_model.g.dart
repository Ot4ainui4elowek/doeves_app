// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseModel _$ErrorResponseModelFromJson(Map<String, dynamic> json) =>
    ErrorResponseModel(
      path: json['path'] as String,
      message: json['message'] as String,
      statusCode: (json['status_code'] as num).toInt(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$ErrorResponseModelToJson(ErrorResponseModel instance) =>
    <String, dynamic>{
      'path': instance.path,
      'message': instance.message,
      'status_code': instance.statusCode,
      'date': instance.date,
    };
