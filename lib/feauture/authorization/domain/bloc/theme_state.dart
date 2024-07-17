part of 'theme_service.dart';

@immutable
sealed class ThemeState {
  ThemeData get theme => lightTheme;
}

final class LightTheme extends ThemeState {
  @override
  ThemeData get theme => lightTheme;
}

final class DarkTheme extends ThemeState {
  @override
  ThemeData get theme => darkTheme;
}
