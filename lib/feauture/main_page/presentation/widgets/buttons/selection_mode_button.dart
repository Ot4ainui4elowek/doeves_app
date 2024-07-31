import 'package:doeves_app/core/presentation/buttons/app_elevated_button.dart';
import 'package:flutter/material.dart';

class SelectionModeButton extends StatelessWidget {
  const SelectionModeButton(
      {super.key, this.onPressed, this.isSelectedMode = false});
  final void Function()? onPressed;
  final bool isSelectedMode;

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      key: key,
      mini: true,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
            Theme.of(context).colorScheme.surfaceContainer),
        side: WidgetStatePropertyAll(
          BorderSide(
            color: isSelectedMode
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
          ),
        ),
      ),
      onPressed: onPressed,
      child: const Icon(Icons.control_point_duplicate_sharp),
    );
  }
}
