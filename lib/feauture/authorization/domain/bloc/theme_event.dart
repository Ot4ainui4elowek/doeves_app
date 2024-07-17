part of 'theme_service.dart';

@immutable
sealed class ThemeEvent {}

class ThemeSwitchLight extends ThemeEvent {}

class ThemeSwitchDark extends ThemeEvent {}
