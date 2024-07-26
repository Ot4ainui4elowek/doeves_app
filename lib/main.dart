import 'package:doeves_app/core/data/shared_preferences/shared_preferences_service.dart';
import 'package:doeves_app/core/domain/container/app_container.dart';
import 'package:doeves_app/feauture/authorization/domain/bloc/theme_service.dart';
import 'package:doeves_app/feauture/doeves_app/presentation/doeves_app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final appContainer = AppContainer.init();

  Future<void> setDeviceTheme() async {
    final preferences = await SharedPreferences.getInstance();
    final sharedPreferncesService = SharedPreferencesService(preferences);
    final themeIsLight = await sharedPreferncesService.getThemeIsLight();
    if (!themeIsLight) {
      appContainer.serviceScope.themeService.add(ThemeSwitchDark());
    }
  }

  await setDeviceTheme();

  runApp(DoevesApp(
    appContainer: appContainer,
  ));
}
