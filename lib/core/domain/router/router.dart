import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/feauture/login_page/presentation/login_page.dart';
import 'package:doeves_app/feauture/login_page/presentation/login_page_vm.dart';
import 'package:doeves_app/feauture/registration_page/presentation/registration_page.dart';
import 'package:doeves_app/feauture/registration_page/presentation/registration_page_vm.dart';
import 'package:doeves_app/feauture/splash_screen/presentation/splash_screen.dart';
import 'package:doeves_app/feauture/splash_screen/presentation/splash_screen_vm.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: AppRoutes.splashScreen,
  routes: [
    GoRoute(
        path: AppRoutes.splashScreen,
        builder: (context, state) => SplashScreen(
              vm: SplashScreenViewModel(),
            ),
        routes: [
          GoRoute(
            path: AppRoutes.loginPage,
            builder: (context, state) => LoginPage(
              vm: LoginPageViewModel(),
            ),
          ),
        ]),
    GoRoute(
      path: AppRoutes.goToRegistrationPage,
      builder: (context, state) => RegistrationPage(
        vm: RegistrationPageViewModel(),
      ),
    ),
  ],
);
