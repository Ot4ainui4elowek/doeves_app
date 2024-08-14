import 'package:doeves_app/core/domain/container/app_container.dart';
import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/feauture/authorization/presentation/login_page/login_page.dart';
import 'package:doeves_app/feauture/authorization/presentation/login_page/login_page_vm.dart';
import 'package:doeves_app/feauture/authorization/presentation/registration_page/registration_page.dart';
import 'package:doeves_app/feauture/authorization/presentation/registration_page/registration_page_vm.dart';
import 'package:doeves_app/feauture/authorization/presentation/verification_page/verification_page.dart';
import 'package:doeves_app/feauture/authorization/presentation/verification_page/verification_page_vm.dart';
import 'package:doeves_app/feauture/create_note/domain/create_note_transfer_object.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page_controller.dart';
import 'package:doeves_app/feauture/create_note/presentation/view_models/create_note_page_vm.dart';
import 'package:doeves_app/feauture/main_page/domain/data_transfer_object.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/catalogs_with_notes_page/catalogs_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/catalogs_with_notes_page/catalogs_page_vm.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/completed_notes_page/completed_notes_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/home_page/home_page.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/home_page/home_page_vm.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/main_page/main_page_large.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/main_page/main_page_small.dart';
import 'package:doeves_app/feauture/search_note_page/presentation/search_note_page.dart';
import 'package:doeves_app/feauture/search_note_page/presentation/search_note_page_vm.dart';
import 'package:doeves_app/feauture/select_new_note_page/presentation/pages/select_new_note_page.dart';
import 'package:doeves_app/feauture/select_new_note_page/presentation/pages/select_new_note_page_vm.dart';
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
                  storage: AppContainer().secureScope.secureStorage,
                  authorizationRepository:
                      AppContainer().repositoryScope.authorizationRepository),
            ),
        routes: [
          GoRoute(
            path: AppRoutes.verificationPage,
            name: AppRoutes.verificationPage,
            builder: (context, state) {
              return VerificationPage(
                vm: VerificationPageViewModel(
                  secureStorage: AppContainer().secureScope.secureStorage,
                  verificationRepository:
                      AppContainer().repositoryScope.verificationRepository,
                ),
              );
            },
          )
        ]),
    GoRoute(
      path: AppRoutes.notesSearchPage,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: SearchNotePage(
          vm: SearchNotePageViewModel(),
        ),
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
            ? MainPageSmall(
                navigationShell: navigationShell,
                scaffoldKey: AppContainer().serviceScope.drawerService.key,
              )
            : MainPageLarge(
                navigationShell: navigationShell,
              ),
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: AppRoutes.notesHomePage,
                name: AppRoutes.notesHomePage,
                builder: (context, state) {
                  final transferObject = state.extra;
                  final isValid = transferObject is DataTransferObject;
                  return NotesHomePage(
                    drawerService: AppContainer().serviceScope.drawerService,
                    vm: NotesHomePageViewModel(
                      noteTransferObject: isValid ? transferObject : null,
                      notesRepository:
                          AppContainer().repositoryScope.notesRepository,
                      storage: AppContainer().secureScope.secureStorage,
                    ),
                  );
                }),
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
              path: AppRoutes.catalogsPage,
              builder: (context, state) => CatalogsPage(
                drawerService: AppContainer().serviceScope.drawerService,
                vm: CatalogsPageViewModel(),
              ),
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
        name: AppRoutes.createNotePage,
        pageBuilder: (context, state) {
          final notesData = state.extra;
          final isValid = notesData is CreateNotePageTransferObject;
          return CustomTransitionPage(
            child: CreateNotePage(
              vm: CreateNotePageViewModel.createVM(
                notesData: isValid ? notesData : null,
                controller: CreateNotePageController(
                  secureStorage: AppContainer().secureScope.secureStorage,
                  createNoteRepository:
                      AppContainer().repositoryScope.createNoteRepository,
                ),
              ),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
              position: animation
                  .drive(Tween(begin: const Offset(1, 0), end: Offset.zero)),
              //opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        }),
    GoRoute(
      path: AppRoutes.registrationPage,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: RegistrationPage(
          vm: RegistrationPageViewModel(
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
