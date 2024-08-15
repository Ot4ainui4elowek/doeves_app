import 'package:doeves_app/core/data/model/list_response_model.dart';
import 'package:doeves_app/core/data/remote_response.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalog_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'catalogs_list_response_model.g.dart';

@JsonSerializable()
class CatalogsListResponseModel implements ListResponseModel {
  CatalogsListResponseModel(this.list);

  @JsonKey(name: 'list')
  @override
  final List<CatalogResponseModel> list;

  factory CatalogsListResponseModel.fromJson(JsonType json) =>
      _$CatalogsListResponseModelFromJson(json);
  JsonType toJson() => _$CatalogsListResponseModelToJson(this);
}
