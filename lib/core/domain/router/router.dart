import 'package:doeves_app/core/domain/container/app_container.dart';
import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/feauture/authorization/presentation/login_page/login_page.dart';
import 'package:doeves_app/feauture/authorization/presentation/login_page/login_page_vm.dart';
import 'package:doeves_app/feauture/authorization/presentation/registration_page/registration_page.dart';
import 'package:doeves_app/feauture/authorization/presentation/registration_page/registration_page_vm.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/main_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/finished_notes_page/finished_notes_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/home_page/home_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/select_new_note_page.dart/select_new_note_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/select_new_note_page.dart/select_new_note_page_vm.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/settings_page/settings_page.dart';
import 'package:doeves_app/feauture/splash_screen/presentation/splash_screen.dart';
import 'package:doeves_app/feauture/splash_screen/presentation/splash_screen_vm.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: AppRoutes.splashScreen,
  routes: [
    GoRoute(
      path: AppRoutes.splashScreen,
      builder: (context, state) => SplashScreen(
        vm: SplashScreenViewModel(
          secureStorage: AppContainer().secureScope.secureStorage,
        ),
      ),
    ),
    GoRoute(
      path: AppRoutes.loginPage,
      builder: (context, state) => LoginPage(
        vm: LoginPageViewModel(
            notificationService:
                AppContainer().serviceScope.notificationService,
            storage: AppContainer().secureScope.secureStorage,
            authorizationRepository:
                AppContainer().repositoryScope.authorizationRepository),
      ),
    ),
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
      builder: (context, state) => SelectNewNotePage(
        vm: SelectNewNotePageViewModel(),
      ),
    ),
    GoRoute(
      path: AppRoutes.createNotePage,
      builder: (context, state) => const CreateNotePage(),
    ),
    GoRoute(
      path: AppRoutes.registrationPage,
      builder: (context, state) => RegistrationPage(
        vm: RegistrationPageViewModel(
            notificationService:
                AppContainer().serviceScope.notificationService,
            authorizationRepository:
                AppContainer().repositoryScope.authorizationRepository),
      ),
    ),
  ],
);
