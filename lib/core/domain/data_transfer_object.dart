sealed class DataTransferObject<T> {
  factory DataTransferObject({
    required final Type type,
    final T? deletedData,
    final T? data,
    final T? editData,
  }) {
    assert(((data == null) ^ (deletedData == null) ^ (editData == null)),
        'Data & edit data & deleted data can not be the same filled!');
    if (deletedData != null) {
      return DeleteDataTransferObject(deletedData);
    }
    if (data != null) {
      return CreateDataTransferObject(data);
    }
    if (editData != null) {
      return EditDataTransferObject(editData);
    }

    throw Exception('Something went wrong with DataTransferObject arguments!');
  }

  factory DataTransferObject.delete(T data) = DeleteDataTransferObject;

  factory DataTransferObject.add(T data) = CreateDataTransferObject;

  factory DataTransferObject.edit(T editData) = EditDataTransferObject;
}

class DeleteDataTransferObject<T> implements DataTransferObject<T> {
  const DeleteDataTransferObject(this.deletedData);
  final T deletedData;
}

class CreateDataTransferObject<T> implements DataTransferObject<T> {
  CreateDataTransferObject(this.data);
  final T data;
}

class EditDataTransferObject<T> implements DataTransferObject<T> {
  EditDataTransferObject(this.editData);
  final T editData;
}
