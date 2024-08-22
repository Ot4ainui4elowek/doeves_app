sealed class CreateCatalogPageDataTransferObject {
  factory CreateCatalogPageDataTransferObject.create() =
      NewCatalogDataTransferObject;
  factory CreateCatalogPageDataTransferObject.open(int catalogId) =
      OpenCatalogDataTrasferObject;
}

class NewCatalogDataTransferObject
    implements CreateCatalogPageDataTransferObject {}

class OpenCatalogDataTrasferObject
    implements CreateCatalogPageDataTransferObject {
  OpenCatalogDataTrasferObject(this.catalogId);
  final int catalogId;
}
