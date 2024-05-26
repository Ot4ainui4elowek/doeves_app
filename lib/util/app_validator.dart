abstract class AppValidator {
  static final RegExp _emailValidator = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static final RegExp _passwordValidator =
      RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}");

  static bool checkEmailIsValid(String email) {
    return _emailValidator.hasMatch(email);
  }

  static bool checkPasswordIsValid(String password) {
    return _passwordValidator.hasMatch(password);
  }
}
