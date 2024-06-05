import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends AppBar {
  final String titleText;
  final BuildContext context;
  CustomAppBar({
    super.key,
    required this.context,
    this.titleText = '',
  }) : super(
          forceMaterialTransparency: true,
          automaticallyImplyLeading: false,
          leadingWidth: context.canPop() ? 76 : 0,
          centerTitle: true,
          leading: context.canPop()
              ? Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: TextButton(
                    onPressed: context.pop,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 15,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 7),
                        Text(
                          'Back',
                          style: AppTextTheme.textBase(
                                  weight: TextWeight.medium)
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                )
              : null,
          title: Text(
            titleText,
            style: AppTextTheme.textBase(weight: TextWeight.medium),
          ),
        );
}
