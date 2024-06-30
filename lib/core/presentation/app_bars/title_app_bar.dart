import 'package:doeves_app/core/presentation/buttons/back_button.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TitleAppBar extends AppBar {
  final String titleText;
  final BuildContext context;
  TitleAppBar({
    super.key,
    required this.context,
    this.titleText = '',
    super.actions,
  }) : super(
          forceMaterialTransparency: true,
          automaticallyImplyLeading: false,
          leadingWidth: context.canPop() ? 82 : 0,
          centerTitle: true,
          leading: context.canPop() ? const CustomBackButton() : null,
          title: Text(
            titleText,
            style: AppTextTheme.textBase(weight: TextWeight.medium),
          ),
        );
}
