import 'package:doeves_app/core/presentation/buttons/app_elevated_button.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      isAsyncButton: false,
      mini: true,
      onPressed: onPressed,
      child: const Icon(Icons.search),
    );
  }
}
