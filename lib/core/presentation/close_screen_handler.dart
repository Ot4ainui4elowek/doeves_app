import 'package:doeves_app/core/domain/data_transfer_object.dart';
import 'package:doeves_app/core/domain/view_model/view_model_factory.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CloseScreenHandler<T> {
  const CloseScreenHandler(
    this._vm,
  );
  final ViewModel _vm;

  void delete({required BuildContext context, required T deleteData}) {
    switch (_vm) {
      case OpenViewModel():
        {
          context.pop(DataTransferObject.delete(deleteData));
          break;
        }

      case CreateViewModel():
        {
          context.pop();
          break;
        }
    }
  }

  void back({required BuildContext context, required T editData}) {
    switch (_vm) {
      case OpenViewModel():
        {
          context.pop(DataTransferObject.edit(editData));
          break;
        }

      case CreateViewModel():
        {
          context.pop(DataTransferObject.add(editData));
          break;
        }
    }
  }
}
