enum DataTransferAction {
  delete,
  add,
  edit;
}

typedef Data = int;

abstract interface class DataTransferObject<T> {}

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
