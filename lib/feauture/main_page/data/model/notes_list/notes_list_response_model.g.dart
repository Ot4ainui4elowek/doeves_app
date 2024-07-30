// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotesListResponseModel _$NotesListResponseModelFromJson(
        Map<String, dynamic> json) =>
    NotesListResponseModel(
      (json['list'] as List<dynamic>)
          .map((e) => NoteResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotesListResponseModelToJson(
        NotesListResponseModel instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
