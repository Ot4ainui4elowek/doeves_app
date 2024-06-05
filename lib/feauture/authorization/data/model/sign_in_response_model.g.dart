// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponseModel _$SignInResponseModelFromJson(Map<String, dynamic> json) =>
    SignInResponseModel(
      token: json['token'] as String,
      userDTO: UserDTO.fromJson(json['userDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignInResponseModelToJson(
        SignInResponseModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'userDTO': instance.userDTO,
    };

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role': instance.role,
    };
