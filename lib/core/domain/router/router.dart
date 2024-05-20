import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/feauture/splash_screen/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: DoevesRoutes.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);
