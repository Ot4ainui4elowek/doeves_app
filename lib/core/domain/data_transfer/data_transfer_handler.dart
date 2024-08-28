import 'dart:developer';

import 'package:doeves_app/core/domain/data_transfer/data_transfer_object.dart';

abstract mixin class DataTransferHandler {
  Future<void> requestToPage<T>({
    required DataTransferObject<T>? data,
    void Function(T deletedData)? delete,
    void Function(T editData)? edit,
    void Function(T data)? create,
  }) async {
    if (data == null) {
      log('data_transfer_controller: empty response');
      return;
    }

    switch (data) {
      case DeleteDataTransferObject<T>(:final deletedData):
        {
          if (delete != null) {
            delete(deletedData);
          }
          return;
        }
      case CreateDataTransferObject<T>(:final data):
        {
          if (create != null) {
            create(data);
          }
          return;
        }
      case EditDataTransferObject<T>(:final editData):
        {
          if (edit != null) {
            edit(editData);
          }
          return;
        }
    }
  }
}
