import 'package:doeves_app/core/presentation/buttons/back_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends AppBar {
  final BuildContext context;
  final Widget? leadeing;
  final Widget? titleWidget;
  CustomAppBar(
      {super.key,
      required this.context,
      this.leadeing,
      this.titleWidget,
      super.actions})
      : super(
          forceMaterialTransparency: true,
          toolbarHeight: 70,
          automaticallyImplyLeading: false,
          title: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(28)),
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                leadeing ??
                    (context.canPop()
                        ? CustomBackButton(
                            style: const ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(horizontal: 8))),
                            color: Theme.of(context).colorScheme.outline,
                          )
                        : const SizedBox(height: 0)),
                titleWidget ?? const SizedBox(height: 0),
              ],
            ),
          ),
        );
}
