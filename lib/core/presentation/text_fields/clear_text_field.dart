import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class ClearTextField extends TextField {
  ClearTextField(
      {super.key,
      required this.context,
      this.textStyle,
      this.hintText = 'Some text...',
      super.autocorrect,
      super.controller,
      super.autofocus,
      super.focusNode,
      super.expands})
      : super(
          maxLines: null,
          style: textStyle ??
              AppTextTheme.textBase(weight: TextWeight.regular).copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: textStyle ??
                AppTextTheme.textBase(weight: TextWeight.regular).copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
          ),
        );
  final TextStyle? textStyle;

  final String? hintText;
  final BuildContext context;
}
