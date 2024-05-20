import 'package:doeves_app/theme/light_colors.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: LightColors.primary,
    primaryContainer: LightColors.primaryLight,
    onPrimary: LightColors.primaryDark,
    secondary: LightColors.secondary,
    secondaryContainer: LightColors.secondaryLight,
    onSecondary: LightColors.secondaryDark,
    tertiary: LightColors.tertiary,
    tertiaryContainer: LightColors.tertiaryLight,
    onTertiary: LightColors.tertiaryDark,
    outline: LightColors.darkGrey,
    outlineVariant: LightColors.grey,
  ),
  textTheme: textTheme,
  useMaterial3: true,
);
