import 'dart:math';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class TaskListItem {
  TaskListItem() {
    id = JWT(Random().nextInt(10000));
  }
  final Rv<bool> isSuccess = false.rv;
  final AppTextEditingController text = AppTextEditingController();
  final FocusNode focusNode = FocusNode();
  late final JWT id;
}
