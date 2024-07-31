import 'package:doeves_app/core/presentation/buttons/app_elevated_button.dart';
import 'package:flutter/material.dart';

class SelectAllButton extends StatelessWidget {
  const SelectAllButton(
      {super.key, this.onPressed, this.listIsSelected = false});

  final void Function()? onPressed;
  final bool listIsSelected;

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      mini: true,
      onPressed: onPressed,
      child: Icon(
          !listIsSelected ? Icons.checklist_outlined : Icons.close_rounded),
    );
  }
}
