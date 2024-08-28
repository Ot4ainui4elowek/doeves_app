import 'package:flutter/material.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper(
      {super.key, required this.child, this.maxWidth = 1000, this.padding});
  final Widget child;
  final double maxWidth;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}
