abstract class AppRoutes {
  static const splashScreen = '/splash-screen';
  static const loginPage = '/login';
  static const registrationPage = '/registration';
  static const notesHomePage = '/notes-home';
  static const tasksPage = '/tasks';
  static const settingsPage = '/settings';
  static const selectNewNotePage = '/select-new-note';
  static const createNotePage = '/create-note';
  static const catalogsPage = '/catalogs';
  static const notesSearchPage = '/notes-search';
  static const goToNotesSearchPage =
      '${AppRoutes.notesHomePage}/${AppRoutes.notesSearchPage}';
  static const verificationPage = 'verification';
  static const goToVerificationPage =
      '${AppRoutes.loginPage}/${AppRoutes.verificationPage}';
  static const operationStatusPage = '/operation-status-page';

  static const createCatalogPage = '/catalog';
  static const goToCreateCatalogPage =
      '${AppRoutes.catalogsPage}/${AppRoutes.createCatalogPage}';
}
