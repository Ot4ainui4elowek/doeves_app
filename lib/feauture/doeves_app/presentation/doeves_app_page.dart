import 'package:doeves_app/core/domain/container/app_container.dart';
import 'package:doeves_app/core/domain/router/router.dart';
import 'package:doeves_app/feauture/authorization/domain/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoevesApp extends StatelessWidget {
  final AppContainer appContainer;
  const DoevesApp({super.key, required this.appContainer});

  ThemeBloc get themeService => appContainer.serviceScope.themeService;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: themeService,
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Doeves',
          theme: themeService.state.theme,
          routerConfig: router,
        );
      },
    );
  }
}
