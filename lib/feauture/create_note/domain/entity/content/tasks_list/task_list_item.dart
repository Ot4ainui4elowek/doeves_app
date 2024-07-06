import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:reactive_variables/reactive_variables.dart';

class TaskListItem {
  final Rv<bool> isSuccess = false.rv;
  final AppTextEditingController text = AppTextEditingController();
}
