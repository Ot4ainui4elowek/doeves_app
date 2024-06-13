import 'package:doeves_app/core/domain/container/app_container.dart';
import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/feauture/authorization/presentation/login_page/login_page.dart';
import 'package:doeves_app/feauture/authorization/presentation/login_page/login_page_vm.dart';
import 'package:doeves_app/feauture/authorization/presentation/registration_page/registration_page.dart';
import 'package:doeves_app/feauture/authorization/presentation/registration_page/registration_page_vm.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/collections_of_notes_page/collections_of_notes_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/completed_notes_page/completed_notes_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/home_page/home_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/main_page/main_page_large.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/main_page/main_page_small.dart';
import 'package:doeves_app/feauture/search_note_page/presentation/search_note_page.dart';
import 'package:doeves_app/feauture/select_new_note_page.dart/presentation/pages/select_new_note_page.dart';
import 'package:doeves_app/feauture/select_new_note_page.dart/presentation/pages/select_new_note_page_vm.dart';
import 'package:doeves_app/feauture/splash_screen/presentation/splash_screen.dart';
import 'package:doeves_app/feauture/splash_screen/presentation/splash_screen_vm.dart';
import 'package:flutter/material.dart';
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
    GoRoute(
      path: AppRoutes.notesSearchPage,
      builder: (context, state) => const SearchNotePage(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => LayoutBuilder(
        builder: (context, constraints) => constraints.maxWidth < 540
            ? MainPageSmall(navigationShell: navigationShell)
            : MainPageLarge(navigationShell: navigationShell),
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.notesHomePage,
              builder: (context, state) => const NotesHomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.completedNotesPage,
              builder: (context, state) => const CompletedNotesPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.collectionOfNotesPage,
              builder: (context, state) => const CollectionsOfNotesPage(),
            ),
          ],
        ),
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
