import 'package:doeves_app/core/domain/id_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalog_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note_response_model.g.dart';

@JsonSerializable()
class NoteResponseModel implements IdModel {
  NoteResponseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.dateOfCreate,
    this.catalog,
  });

  factory NoteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NoteResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoteResponseModelToJson(this);

  @override
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'date_of_create')
  final DateTime dateOfCreate;

  @JsonKey(name: 'catalog')
  final CatalogResponseModel? catalog;
}
