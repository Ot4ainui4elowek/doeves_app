import 'package:doeves_app/core/domain/container/app_container.dart';
import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/feauture/login_page/presentation/login_page.dart';
import 'package:doeves_app/feauture/login_page/presentation/login_page_vm.dart';
import 'package:doeves_app/feauture/main_page/presentation/main_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/finished_notes_page/finished_notes_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/home_page/home_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/select_new_note_page.dart/select_new_note_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/settings_page/settings_page.dart';
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
                    vm: LoginPageViewModel(
                        authorizationRepository: AppContainer()
                            .repositoryScope
                            .authorizationRepository),
                  ),
              routes: [
                StatefulShellRoute.indexedStack(
                  builder: (context, state, navigationShell) => DoevesMainPage(
                    navigationShell: navigationShell,
                  ),
                  branches: [
                    StatefulShellBranch(routes: [
                      GoRoute(
                        path: AppRoutes.notesHomePage,
                        builder: (context, state) => const NotesHomePage(),
                      )
                    ]),
                    StatefulShellBranch(routes: [
                      GoRoute(
                        path: AppRoutes.finishedNotesPage,
                        builder: (context, state) => const FinishedNotesPage(),
                      )
                    ]),
                    StatefulShellBranch(routes: [
                      GoRoute(
                        path: AppRoutes.settingsPage,
                        builder: (context, state) => const SettingsPage(),
                      )
                    ]),
                  ],
                ),
                GoRoute(
                  path: AppRoutes.selectNewNotePage,
                  builder: (context, state) => const SelectNewNotePage(),
                )
              ]),
        ]),
    GoRoute(
      path: AppRoutes.goToRegistrationPage,
      builder: (context, state) => RegistrationPage(
        vm: RegistrationPageViewModel(),
      ),
    ),
  ],
);
