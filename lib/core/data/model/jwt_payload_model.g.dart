// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JwtPayloadModel _$JwtPayloadModelFromJson(Map<String, dynamic> json) =>
    JwtPayloadModel(
      scopes:
          (json['scopes'] as List<dynamic>).map((e) => e as String).toList(),
      isVerified: json['isVerified'] as bool,
      sub: json['sub'] as String,
      iat: (json['iat'] as num).toInt(),
      exp: (json['exp'] as num).toInt(),
    );

Map<String, dynamic> _$JwtPayloadModelToJson(JwtPayloadModel instance) =>
    <String, dynamic>{
      'scopes': instance.scopes,
      'isVerified': instance.isVerified,
      'sub': instance.sub,
      'iat': instance.iat,
      'exp': instance.exp,
    };
