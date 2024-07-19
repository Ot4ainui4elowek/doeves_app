import 'package:doeves_app/core/domain/container/app_container.dart';
import 'package:doeves_app/feauture/authorization/domain/bloc/theme_service.dart';

class AppDrawerViewModel {
  AppDrawerViewModel();

  // final SharedPreferencesService _preferencesService =
  //     AppContainer().serviceScope?.sharedPreferencesService;

  final ThemeService themeBloc = AppContainer().serviceScope.themeService;

  Future<void> setTheme() async {
    themeBloc.add(
      themeBloc.state is DarkTheme ? ThemeSwitchLight() : ThemeSwitchDark(),
    );
    //_preferencesService.setTheme(themeBloc.state is DarkTheme);
  }
}
