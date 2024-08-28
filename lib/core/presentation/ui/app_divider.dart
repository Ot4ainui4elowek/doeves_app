import 'package:flutter/material.dart';

class AppDivider extends Divider {
  final BuildContext context;
  AppDivider({
    super.key,
    required this.context,
    super.endIndent,
    super.height,
    super.indent,
    super.thickness,
  }) : super(
          color: Theme.of(context).dividerColor,
        );
}
