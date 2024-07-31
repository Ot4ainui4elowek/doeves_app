import 'package:doeves_app/core/presentation/buttons/app_elevated_button.dart';
import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      mini: true,
      onPressed: onPressed,
      child: const Icon(Icons.refresh_outlined),
    );
  }
}
