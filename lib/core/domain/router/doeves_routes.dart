abstract class AppRoutes {
  static const splashScreen = '/splash-screen';
  static const loginPage = '/login';
  static const registrationPage = '/registration';
  static const notesHomePage = '/notes-home';
  static const completedNotesPage = '/finished-notes';
  static const settingsPage = '/settings';
  static const selectNewNotePage = '/select-new-note';
  static const createNotePage = '/create-note';
  static const collectionOfNotesPage = '/collection-of-notes';
  static const notesSearchPage = '/notes-search';
  static const goToNotesSearchPage =
      '${AppRoutes.notesHomePage}/${AppRoutes.notesSearchPage}';
}
