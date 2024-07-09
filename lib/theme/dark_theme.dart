import 'package:doeves_app/theme/dark_colors.dart';
import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    surfaceContainer: AppDarkColors.surfaceContainer,
    brightness: Brightness.dark,
    primary: AppDarkColors.primary,
    onPrimary: AppDarkColors.onPrimary,
    secondary: AppDarkColors.secondary,
    onSecondary: AppDarkColors.onSecondary,
    error: AppDarkColors.error,
    onError: AppDarkColors.onError,
    surface: AppDarkColors.surface,
    onSurface: AppDarkColors.onSurface,
    tertiary: AppDarkColors.tertiary,
    onTertiary: AppDarkColors.onTertiary,
    primaryContainer: AppDarkColors.primaryContainer,
    onPrimaryContainer: AppDarkColors.onPrimaryContainer,
    secondaryContainer: AppDarkColors.secondaryContainer,
    onSecondaryContainer: AppDarkColors.onSecondaryContainer,
    tertiaryContainer: AppDarkColors.tertiaryContainer,
    onTertiaryContainer: AppDarkColors.onTertiaryContainer,
    errorContainer: AppDarkColors.errorContainer,
    onErrorContainer: AppDarkColors.onErrorContainer,
    outline: AppDarkColors.outline,
    outlineVariant: AppDarkColors.outlineVariant,
    onSurfaceVariant: AppDarkColors.onSurfaceVariant,
    inverseSurface: AppDarkColors.inverseSurface,
    onInverseSurface: AppDarkColors.onInverseSurface,
    scrim: AppDarkColors.scrim,
    shadow: AppDarkColors.shadow,
    inversePrimary: AppDarkColors.inversePrimary,
    surfaceContainerHighest: AppDarkColors.onSurfaceContainerHight,
  ),
  useMaterial3: true,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
    ),
  ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll(
        EdgeInsets.all(13),
      ),
      iconColor: WidgetStatePropertyAll(AppDarkColors.outline),
    ),
  ),
  checkboxTheme: const CheckboxThemeData(
    side: BorderSide(color: AppDarkColors.outline, width: 2),
  ),
  dividerColor: AppDarkColors.outline,
  inputDecorationTheme: const InputDecorationTheme(
    prefixIconColor: AppDarkColors.outline,
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
  ),
);
