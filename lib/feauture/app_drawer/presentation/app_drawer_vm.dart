import 'package:doeves_app/core/data/shared_preferences/shared_preferences_service.dart';
import 'package:doeves_app/core/domain/container/app_container.dart';
import 'package:doeves_app/feauture/authorization/domain/bloc/theme_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawerViewModel {
  AppDrawerViewModel();

  final ThemeService themeBloc = AppContainer().serviceScope.themeService;
  Future<SharedPreferencesService> getSharedPreferences() async {
    final preferences = await SharedPreferences.getInstance();
    return SharedPreferencesService(preferences);
  }

  Future<void> setTheme() async {
    final preferencesService = await getSharedPreferences();
    themeBloc.add(
      themeBloc.state is DarkTheme ? ThemeSwitchLight() : ThemeSwitchDark(),
    );
    preferencesService.setTheme(themeBloc.state is DarkTheme);
  }
}
