import 'package:doeves_app/core/data/remote_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'catalog_request_model.g.dart';

@JsonSerializable()
class CatalogRequestModel {
  CatalogRequestModel(this.name);
  final String name;

  factory CatalogRequestModel.fromJson(JsonType json) =>
      _$CatalogRequestModelFromJson(json);

  JsonType toJson() => _$CatalogRequestModelToJson(this);
}
