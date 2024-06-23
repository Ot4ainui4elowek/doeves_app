import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/container/app_container.dart';
import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/buttons/app_filled_button.dart';
import 'package:doeves_app/feauture/authorization/presentation/login_page/login_page.dart';
import 'package:doeves_app/feauture/authorization/presentation/login_page/login_page_vm.dart';
import 'package:doeves_app/feauture/authorization/presentation/registration_page/registration_page.dart';
import 'package:doeves_app/feauture/authorization/presentation/registration_page/registration_page_vm.dart';
import 'package:doeves_app/feauture/authorization/presentation/verification_page/verification_page.dart';
import 'package:doeves_app/feauture/authorization/presentation/verification_page/verification_page_vm.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page.dart';
import 'package:doeves_app/feauture/error_page/presentation/error_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/collections_of_notes_page/collections_of_notes_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/completed_notes_page/completed_notes_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/home_page/home_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/main_page/main_page_large.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/main_page/main_page_small.dart';
import 'package:doeves_app/feauture/operation_status_page/domain/entity/data_for_the_status_page.dart';
import 'package:doeves_app/feauture/operation_status_page/presentation/operation_status_page.dart';
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
        path: AppRoutes.operationStatusPage,
        builder: (context, state) {
          if (state.extra is DataForTheStatusPage) {
            return OperationStatusPage(
              data: DataForTheStatusPage(
                  leadingOnPressed: () => context.go(AppRoutes.loginPage),
                  result: UseCaseResult.bad([SpecificError('Oooops!')]),
                  actions: [
                    AppFilledButton(
                      child: const Text('Go to login'),
                      onPressed: () {
                        context.go(AppRoutes.loginPage);
                      },
                    )
                  ]),
            );
          } else {
            return const ErrorPage(
              errorMessage: 'Operation status data is not valid',
            );
          }
        }),
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
        routes: [
          GoRoute(
              path: AppRoutes.verificationPage,
              name: AppRoutes.verificationPage,
              builder: (context, state) {
                final String email = state.extra as String;
                return VerificationPage(
                  vm: VerificationPageViewModel(
                    notificationService:
                        AppContainer().serviceScope.notificationService,
                    secureStorage: AppContainer().secureScope.secureStorage,
                    verificationRepository:
                        AppContainer().repositoryScope.verificationRepository,
                  ),
                  email: email,
                );
              })
        ]),
    GoRoute(
      path: AppRoutes.notesSearchPage,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const SearchNotePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: animation.drive(
            Tween(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ),
          ),
          //opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        ),
      ),
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
      pageBuilder: (context, state) => CustomTransitionPage(
        child: SelectNewNotePage(
          vm: SelectNewNotePageViewModel(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: animation
              .drive(Tween(begin: const Offset(1, 0), end: Offset.zero)),
          //opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: AppRoutes.createNotePage,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const CreateNotePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: animation
              .drive(Tween(begin: const Offset(1, 0), end: Offset.zero)),
          //opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: AppRoutes.registrationPage,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: RegistrationPage(
          vm: RegistrationPageViewModel(
              notificationService:
                  AppContainer().serviceScope.notificationService,
              authorizationRepository:
                  AppContainer().repositoryScope.authorizationRepository),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
          position: animation
              .drive(Tween(begin: const Offset(1, 0), end: Offset.zero)),
          //opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        ),
      ),
    ),
  ],
);
