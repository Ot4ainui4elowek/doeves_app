sealed class DataTransferObject<T> {
  factory DataTransferObject({
    final int? id,
    final T? data,
    final T? editData,
  }) {
    assert(((data == null) ^ (id == null) ^ (editData == null)),
        'Data & edit data & id data can not be the same filled!');
    if (id != null) {
      return DeleteDataTransferObject(id);
    }
    if (data != null) {
      return AddDataTransferObject(data);
    }
    if (editData != null) {
      return EditDataTransferObject(editData);
    }

    throw Exception('Something went wrong with DataTransferObject arguments!');
  }

  factory DataTransferObject.delete(int id) = DeleteDataTransferObject;

  factory DataTransferObject.add(T data) = AddDataTransferObject;

  factory DataTransferObject.edit(T editData) = EditDataTransferObject;
}

class DeleteDataTransferObject<T> implements DataTransferObject<T> {
  DeleteDataTransferObject(this.id);
  final int id;
}

class AddDataTransferObject<T> implements DataTransferObject<T> {
  AddDataTransferObject(this.data);
  final T data;
}

class EditDataTransferObject<T> implements DataTransferObject<T> {
  EditDataTransferObject(this.editData);
  final T editData;
}
