import 'package:doeves_app/theme/light_colors.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppLightColors.primary,
    onPrimary: AppLightColors.onPrimary,
    secondary: AppLightColors.secondary,
    onSecondary: Colors.white,
    error: AppLightColors.error,
    onError: AppLightColors.onError,
    surface: AppLightColors.surface,
    onSurface: AppLightColors.onSurface,
    tertiary: AppLightColors.tertiary,
    onTertiary: AppLightColors.onTertiary,
    primaryContainer: AppLightColors.primaryContainer,
    onPrimaryContainer: AppLightColors.onPrimaryContainer,
    secondaryContainer: AppLightColors.secondaryContainer,
    onSecondaryContainer: AppLightColors.onSecondaryContainer,
    tertiaryContainer: AppLightColors.tertiaryContainer,
    onTertiaryContainer: AppLightColors.onTertiaryContainer,
    errorContainer: AppLightColors.errorContainer,
    onErrorContainer: AppLightColors.onErrorContainer,
    outline: AppLightColors.outline,
    outlineVariant: AppLightColors.outlineVariant,
    onSurfaceVariant: AppLightColors.onSurfaceVariant,
    inverseSurface: AppLightColors.inverseSurface,
    onInverseSurface: AppLightColors.onInverseSurface,
    scrim: AppLightColors.scrim,
    shadow: AppLightColors.shadow,
    inversePrimary: AppLightColors.inversePrimary,
  ),
  useMaterial3: true,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
    ),
  ),
);
