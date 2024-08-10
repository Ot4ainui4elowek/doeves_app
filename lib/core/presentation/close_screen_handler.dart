import 'package:doeves_app/core/domain/view_model/view_model_factory.dart';
import 'package:doeves_app/feauture/main_page/domain/data_transfer_object.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CloseScreenHandler<T> {
  const CloseScreenHandler(this._vm);

  final ViewModel _vm;

  void delete({required BuildContext context, required int id}) {
    switch (_vm) {
      case OpenViewModel():
        {
          context.pop(
            DataTransferObject(action: DataTransferAction.delete, data: id),
          );
          break;
        }

      case CreateViewModel():
        {
          context.pop();
          break;
        }
    }
  }

  void back({required BuildContext context, required int id}) {
    switch (_vm) {
      case OpenViewModel():
        {
          context.pop(
            DataTransferObject(action: DataTransferAction.edit, data: id),
          );
          break;
        }

      case CreateViewModel():
        {
          context.pop(
            DataTransferObject(action: DataTransferAction.add, data: id),
          );
          break;
        }
    }
  }
}
