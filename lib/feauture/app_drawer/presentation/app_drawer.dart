import 'package:doeves_app/core/presentation/logo/app_logo_animated.dart';
import 'package:doeves_app/core/presentation/network_connection_widget/network_connection_widget.dart';
import 'package:doeves_app/feauture/app_drawer/presentation/app_drawer_vm.dart';
import 'package:doeves_app/feauture/authorization/domain/bloc/theme_service.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final AppDrawerViewModel vm = AppDrawerViewModel();

  Widget get _themeSwitchBuilder => BlocBuilder(
        bloc: vm.themeBloc,
        builder: (context, state) => SwitchListTile(
          hoverColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Dark theme',
            style: AppTextTheme.textBase(weight: TextWeight.medium),
          ),
          value: vm.themeBloc.state is DarkTheme,
          onChanged: (value) => vm.setTheme(),
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
            NetworkConnectionWidget(),
            const SizedBox(height: 20),
            _themeSwitchBuilder,
          ],
        ),
      ),
    );
  }
}
