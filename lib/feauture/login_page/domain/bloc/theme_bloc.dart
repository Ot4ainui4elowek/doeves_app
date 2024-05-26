import 'package:bloc/bloc.dart';
import 'package:doeves_app/theme/dark_theme.dart';
import 'package:doeves_app/theme/light_theme.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightTheme()) {
    on<ThemeSwitchDark>((event, emit) {
      emit(DarkTheme());
    });
    on<ThemeSwitchLight>((event, emit) {
      emit(LightTheme());
    });
  }
}
