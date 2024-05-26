abstract class AppRoutes {
  static const splashScreen = '/splash-screen';
  static const loginPage = 'login-page';
  static const goToLoginPage =
      '${AppRoutes.splashScreen}/${AppRoutes.loginPage}';
  static const registrationPage = 'registration-page';
  static const goToRegistrationPage =
      '${AppRoutes.splashScreen}/${AppRoutes.registrationPage}';
}
