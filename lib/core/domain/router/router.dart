import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/feauture/login_page/presentation/login_page.dart';
import 'package:doeves_app/feauture/splash_screen/presentation/splash_screen.dart';
import 'package:doeves_app/feauture/splash_screen/presentation/splash_screen_vm.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: DoevesRoutes.splashScreen,
  routes: [
    GoRoute(
        path: DoevesRoutes.splashScreen,
        builder: (context, state) => SplashScreen(
              vm: SplashScreenViewModel(),
            ),
        routes: [
          GoRoute(
            path: DoevesRoutes.loginPage,
            builder: (context, state) => const LoginPage(),
          )
        ]),
  ],
);
