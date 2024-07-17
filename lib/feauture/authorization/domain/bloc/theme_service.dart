import 'package:doeves_app/theme/dark_theme.dart';
import 'package:doeves_app/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeService extends Bloc<ThemeEvent, ThemeState> {
  ThemeService() : super(LightTheme()) {
    on<ThemeSwitchDark>((event, emit) {
      emit(DarkTheme());
    });
    on<ThemeSwitchLight>((event, emit) {
      emit(LightTheme());
    });
  }
}
