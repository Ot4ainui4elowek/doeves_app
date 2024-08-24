import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalog_response_model.dart';

sealed class CreateCatalogDataTransferObject {
  factory CreateCatalogDataTransferObject.create() =
      NewCatalogDataTransferObject;
  factory CreateCatalogDataTransferObject.open(CatalogResponseModel catalog) =
      OpenCatalogDataTrasferObject;
}

class NewCatalogDataTransferObject implements CreateCatalogDataTransferObject {}

class OpenCatalogDataTrasferObject implements CreateCatalogDataTransferObject {
  OpenCatalogDataTrasferObject(this.catalog);
  final CatalogResponseModel catalog;
}
