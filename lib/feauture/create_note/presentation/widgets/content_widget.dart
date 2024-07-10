import 'package:flutter/material.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
    required this.contentBuilder,
    required this.deleteContent,
    required this.index,
    this.padding,
  });
  final int index;
  final Widget contentBuilder;
  final void Function() deleteContent;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        deleteContent();
      },
      key: key ?? ValueKey(contentBuilder),
      background: Container(
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 36),
              child: contentBuilder,
            ),
            Positioned(
              top: 0,
              right: 0,
              child: ReorderableDelayedDragStartListener(
                index: index,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.drag_indicator_outlined,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
