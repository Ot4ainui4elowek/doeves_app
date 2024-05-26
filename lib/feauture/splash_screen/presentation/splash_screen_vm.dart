import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreenViewModel {
  Future<void> goToLoginPage(BuildContext context) => Future.delayed(
      const Duration(seconds: 5), () => context.go(AppRoutes.goToLoginPage));
}
