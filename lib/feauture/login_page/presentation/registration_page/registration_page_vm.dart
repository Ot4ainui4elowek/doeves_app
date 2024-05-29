import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/password_text_editing_controller.dart';
import 'package:doeves_app/util/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class RegistrationPageViewModel {
  final fullNameTextController = AppTextEditingController();
  final emailTextController = AppTextEditingController();
  final passwordTextController = PasswordTextEditingController();
  final retypePasswordTextController = PasswordTextEditingController();
  final registrationFormIsValid = false.rv;

  void init() {
    for (TextEditingController controller in <TextEditingController>[
      fullNameTextController,
      emailTextController,
      passwordTextController,
      retypePasswordTextController,
    ]) {
      controller.addListener(checkRegistrationFormIsValid);
    }
  }

  void dispose() {
    for (TextEditingController controller in <TextEditingController>[
      fullNameTextController,
      emailTextController,
      passwordTextController,
      retypePasswordTextController,
    ]) {
      controller.removeListener(checkRegistrationFormIsValid);
    }
  }

  void checkRegistrationFormIsValid() {
    debugPrint('dsfsdef');
    registrationFormIsValid(fullNameTextController.text.length > 3 &&
        AppValidator.checkEmailIsValid(emailTextController.text) &&
        AppValidator.checkPasswordIsValid(passwordTextController.text) &&
        passwordTextController.text == retypePasswordTextController.text);
  }
}
