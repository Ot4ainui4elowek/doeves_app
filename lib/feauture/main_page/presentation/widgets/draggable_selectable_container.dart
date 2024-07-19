import 'package:flutter/material.dart';

class DraggableSelectableContainer extends StatelessWidget {
  const DraggableSelectableContainer(
      {super.key,
      required this.deleteModeEnabled,
      required this.thisItemIsSelected,
      required this.child});
  final bool deleteModeEnabled;
  final bool thisItemIsSelected;
  final Widget child;

  BoxDecoration _boxDecorationBuilder(BuildContext context) => BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        border: deleteModeEnabled
            ? Border.all(
                color: thisItemIsSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outlineVariant,
              )
            : null,
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: deleteModeEnabled
          ? const EdgeInsets.symmetric(vertical: 3, horizontal: 14)
          : const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
      margin: EdgeInsets.symmetric(
          vertical: deleteModeEnabled ? 10 : 7,
          horizontal: deleteModeEnabled ? 24 : 16),
      decoration: _boxDecorationBuilder(context),
      child: child,
    );
  }
}
