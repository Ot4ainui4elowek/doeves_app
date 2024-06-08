import 'package:doeves_app/core/domain/container/app_container.dart';
import 'package:doeves_app/core/presentation/logo/app_logo_animated.dart';
import 'package:doeves_app/feauture/authorization/domain/bloc/theme_bloc.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});
  final ThemeBloc _themeBloc = AppContainer().serviceScope.themeService;

  Widget get _themeSwitchBuilder => BlocBuilder(
        bloc: _themeBloc,
        builder: (context, state) => Switch(
          value: _themeBloc.state is DarkTheme,
          onChanged: (value) => _themeBloc.add(
            _themeBloc.state is DarkTheme
                ? ThemeSwitchLight()
                : ThemeSwitchDark(),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const AppLogoAnimated(
              repeat: false,
              curve: Curves.easeOutSine,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark theme',
                  style: AppTextTheme.textBase(weight: TextWeight.medium),
                ),
                _themeSwitchBuilder,
              ],
            )
          ],
        ),
      ),
    );
  }
}
