import 'package:doeves_app/core/data/remote_response.dart';
import 'package:doeves_app/core/domain/id_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'catalog_response_model.g.dart';

@JsonSerializable()
class CatalogResponseModel implements IdModel {
  CatalogResponseModel({
    required this.id,
    required this.name,
    this.dateOfCreate,
  });

  @override
  final int id;
  final String name;
  final DateTime? dateOfCreate;

  factory CatalogResponseModel.fromJson(JsonType json) =>
      _$CatalogResponseModelFromJson(json);

  JsonType toJson() => _$CatalogResponseModelToJson(this);
}
