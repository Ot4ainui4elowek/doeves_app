enum DataTransferAction {
  delete,
  add,
  edit;
}

typedef Data = int;

class DataTransferObject<T> {
  const DataTransferObject({
    required this.action,
    required this.data,
  });
  final DataTransferAction action;
  final Data data;
}
