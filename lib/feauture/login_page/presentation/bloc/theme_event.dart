part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

class ThemeSwitchLight extends ThemeEvent {}

class ThemeSwitchDark extends ThemeEvent {}
