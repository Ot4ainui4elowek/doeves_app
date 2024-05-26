part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {
  final theme = lightTheme;
}

final class LightTheme extends ThemeState {
  @override
  final theme = lightTheme;
}

final class DarkTheme extends ThemeState {
  @override
  final theme = darkTheme;
}
