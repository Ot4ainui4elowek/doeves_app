part of 'app_router.dart';

final _goRouter = GoRouter(
  errorBuilder: (context, state) => const ErrorPage(),
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
              builder: (context, state) => NotesHomePage(
                drawerService: AppContainer().serviceScope.drawerService,
                vm: NotesHomePageViewModel(
                  notesRepository:
                      AppContainer().repositoryScope.notesRepository,
                  storage: AppContainer().secureScope.secureStorage,
                ),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.tasksPage,
              builder: (context, state) => const TasksPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: AppRoutes.catalogsPage,
          routes: [
            GoRoute(
              path: AppRoutes.catalogsPage,
              name: AppRoutes.catalogsPage,
              builder: (context, state) => CatalogsPage(
                drawerService: AppContainer().serviceScope.drawerService,
                vm: CatalogsPageViewModel(
                  catalogsRepository:
                      AppContainer().repositoryScope.catalogsRepository,
                  secureStorage: AppContainer().secureScope.secureStorage,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.createCatalogPage,
      pageBuilder: (context, state) {
        final catalogData = state.extra;
        final isValid = catalogData is CreateCatalogDataTransferObject;
        return CustomTransitionPage(
          child:
              AppRouter.createCatalogPage(data: isValid ? catalogData : null),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: animation
                .drive(Tween(begin: const Offset(1, 0), end: Offset.zero)),
            //opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        );
      },
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
          final isValid = notesData is CreateNoteDataTransferObject;
          return CustomTransitionPage(
            child: AppRouter.createNotePage(data: isValid ? notesData : null),
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
