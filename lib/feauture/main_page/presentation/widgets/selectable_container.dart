import 'package:flutter/material.dart';

class SelectableContainer extends StatelessWidget {
  const SelectableContainer(
      {super.key,
      required this.isSelectedMode,
      required this.thisItemIsSelected,
      required this.child});
  final bool isSelectedMode;
  final bool thisItemIsSelected;
  final Widget child;

  BoxDecoration _boxDecorationBuilder(BuildContext context) => BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        border: isSelectedMode
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
      padding: isSelectedMode
          ? const EdgeInsets.symmetric(vertical: 3, horizontal: 14)
          : const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
      margin: EdgeInsets.symmetric(
          vertical: isSelectedMode ? 10 : 7,
          horizontal: isSelectedMode ? 24 : 16),
      decoration: _boxDecorationBuilder(context),
      child: child,
    );
  }
}
