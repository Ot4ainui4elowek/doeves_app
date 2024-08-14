import 'package:doeves_app/core/presentation/buttons/app_elevated_button.dart';
import 'package:flutter/material.dart';

class BurgerMenuButton extends StatelessWidget {
  const BurgerMenuButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: MediaQuery.of(context).size.width < 540,
      child: AppElevatedButton(
        mini: true,
        onPressed: onPressed,
        child: const Icon(Icons.menu),
      ),
    );
  }
}
