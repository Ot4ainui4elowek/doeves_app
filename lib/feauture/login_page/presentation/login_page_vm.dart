import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/password_text_editing_controller.dart';
import 'package:doeves_app/util/app_validator.dart';
import 'package:reactive_variables/reactive_variables.dart';

class LoginPageViewModel {
  final emailTextController = AppTextEditingController();
  final passwordTextController = PasswordTextEditingController();
  final authorizationIsValid = false.rv;
  void init() {
    emailTextController.addListener(checkFormIsValid);
    passwordTextController.addListener(checkFormIsValid);
  }

  void dispose() {
    emailTextController.removeListener(checkFormIsValid);
    passwordTextController.removeListener(checkFormIsValid);
  }

  void checkFormIsValid() {
    authorizationIsValid(
        AppValidator.checkEmailIsValid(emailTextController.text) &&
            AppValidator.checkPasswordIsValid(passwordTextController.text));
  }
}
