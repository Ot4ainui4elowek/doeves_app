abstract class AppRoutes {
  static const splashScreen = '/splash-screen';
  static const loginPage = 'login-page';
  static const goToLoginPage =
      '${AppRoutes.splashScreen}/${AppRoutes.loginPage}';
  static const registrationPage = 'registration-page';
  static const goToRegistrationPage =
      '${AppRoutes.splashScreen}/${AppRoutes.registrationPage}';
  static const notesHomePage = 'notes-home-page';
  static const goToNotesHomePage =
      '${AppRoutes.goToLoginPage}/${AppRoutes.notesHomePage}';
  static const finishedNotesPage = 'finished-notes-page';
  static const goToFinishedNotesPage =
      '${AppRoutes.goToLoginPage}/${AppRoutes.finishedNotesPage}';
  static const settingsPage = 'settings-page';
  static const goToSettingsPage =
      '${AppRoutes.goToLoginPage}/${AppRoutes.settingsPage}';
  static const selectNewNotePage = 'select-new-note-page';
  static const goToSelectNewNotePage =
      '${AppRoutes.goToLoginPage}/${AppRoutes.selectNewNotePage}';
  static const createNotePage = 'create-note-page';
  static const goToCreateNotePage =
      '${AppRoutes.goToLoginPage}/${AppRoutes.createNotePage}';
}
