import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:flutter/material.dart';

class DataForTheStatusPage {
  const DataForTheStatusPage({
    required this.leadingOnPressed,
    this.actions,
    required this.result,
  });
  final void Function() leadingOnPressed;
  final List<Widget>? actions;
  final UseCaseResult result;
}
