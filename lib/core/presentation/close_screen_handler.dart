import 'package:doeves_app/core/domain/view_model/view_model_factory.dart';
import 'package:doeves_app/feauture/main_page/domain/data_transfer_object.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CloseScreenHandler<T> {
  const CloseScreenHandler(
    this._vm,
  );
  final ViewModel _vm;

  void delete({required BuildContext context, required int id}) {
    switch (_vm) {
      case OpenViewModel():
        {
          context.pop(DeleteDataTransferObject(id));
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
          context.pop(EditDataTransferObject(editData));
          break;
        }

      case CreateViewModel():
        {
          context.pop(AddDataTransferObject(editData));
          break;
        }
    }
  }
}
