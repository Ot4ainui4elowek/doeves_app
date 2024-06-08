import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.style,
  });
  final Widget child;
  final void Function() onPressed;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: child,
      style: style,
    );
  }
}
