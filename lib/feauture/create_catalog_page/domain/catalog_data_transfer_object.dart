sealed class CatalogDataTransferObject {
  factory CatalogDataTransferObject.create() = CreateCatalogDataTransferObject;
  factory CatalogDataTransferObject.open(int catalogId) =
      OpenCatalogDatatrasferObject;
}

class CreateCatalogDataTransferObject implements CatalogDataTransferObject {}

class OpenCatalogDatatrasferObject implements CatalogDataTransferObject {
  OpenCatalogDatatrasferObject(this.catalogId);
  final int catalogId;
}
