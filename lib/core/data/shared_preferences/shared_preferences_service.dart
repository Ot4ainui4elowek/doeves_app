import 'package:shared_preferences/shared_preferences.dart';

abstract class AppSharedPreferencesKeys {
  static const String themeIsLight = 'theme-is-light';
}

class SharedPreferencesService {
  const SharedPreferencesService(this._preferences);

  final SharedPreferences _preferences;

  Future<bool> getThemeIsLight() async {
    return _preferences.getBool(AppSharedPreferencesKeys.themeIsLight) ?? true;
  }

  Future<void> setTheme(bool value) async {
    await _preferences.setBool(AppSharedPreferencesKeys.themeIsLight, value);
  }
}
