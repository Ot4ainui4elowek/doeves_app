import 'package:doeves_app/core/domain/router/router.dart';
import 'package:doeves_app/theme/light_theme.dart';
import 'package:flutter/material.dart';

class DoevesApp extends StatelessWidget {
  const DoevesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Doeves',
      theme: lightTheme,
      routerConfig: router,
    );
  }
}
