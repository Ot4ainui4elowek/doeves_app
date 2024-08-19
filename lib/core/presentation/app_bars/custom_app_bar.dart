import 'package:doeves_app/core/presentation/buttons/back_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends AppBar {
  final BuildContext context;
  final Widget? leadeing;
  final Widget? titleWidget;
  final bool leadingIsAutomaticlySet;
  final bool isSelected;
  CustomAppBar({
    this.isSelected = false,
    super.key,
    required this.context,
    this.leadeing,
    this.titleWidget,
    super.actions,
    this.leadingIsAutomaticlySet = true,
  }) : super(
          forceMaterialTransparency: true,
          toolbarHeight: 70,
          automaticallyImplyLeading: false,
          title: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            constraints: const BoxConstraints(maxHeight: 50),
            height: 50,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(28)),
              color: Theme.of(context).colorScheme.surfaceContainer,
              border: isSelected
                  ? Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      strokeAlign: BorderSide.strokeAlignInside)
                  : null,
            ),
            child: Flex(
              //clipBehavior: Clip.antiAlias,
              direction: Axis.horizontal,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                leadeing ??
                    (context.canPop() && leadingIsAutomaticlySet
                        ? CustomBackButton(
                            style: const ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                    EdgeInsets.only(left: 8, right: 16))),
                            color: Theme.of(context).colorScheme.outline,
                          )
                        : const SizedBox(height: 0)),
                titleWidget ?? const SizedBox(height: 0),
              ],
            ),
          ),
        );
}
