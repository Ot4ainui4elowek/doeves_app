import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/password_text_editing_controller.dart';
import 'package:doeves_app/feauture/login_page/data/model/sign_up_response_model.dart';
import 'package:doeves_app/feauture/login_page/domain/authorization_strategy/strategy.dart';
import 'package:doeves_app/feauture/login_page/domain/repository/authorization_repository.dart';
import 'package:doeves_app/util/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class RegistrationPageViewModel {
  final fullNameTextController = AppTextEditingController();
  final emailTextController = AppTextEditingController();
  final passwordTextController = PasswordTextEditingController();
  final retypePasswordTextController = PasswordTextEditingController();
  final registrationFormIsValid = false.rv;
  final AuthorizationRepository _authorizationRepository;
  RegistrationPageViewModel({required authorizationRepository})
      : _authorizationRepository = authorizationRepository;
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
    registrationFormIsValid(fullNameTextController.text.length > 3 &&
        AppValidator.checkEmailIsValid(emailTextController.text) &&
        AppValidator.checkPasswordIsValid(passwordTextController.text) &&
        passwordTextController.text == retypePasswordTextController.text);
  }

  Future<void> signUp({required SignUpStrategy strategy}) async {
    final signUpResponse = await strategy();
    switch (signUpResponse) {
      case GoodUseCaseResult<SignUpResponseModel>(:final data):
        {
          debugPrint(data.message);
        }
      case BadUseCaseResult<SignUpResponseModel>(:final errorList):
        {
          for (var error in errorList) {
            debugPrint(error.description);
          }
        }
    }
  }

  Future<void> signUpWitchEmailStrategy() async {
    final signUpStrategy = SignUpUsingEmailStrategy(
      _authorizationRepository,
      fullName: fullNameTextController.text,
      email: emailTextController.text,
      password: passwordTextController.text,
      retypePassword: retypePasswordTextController.text,
    );
    return await signUp(strategy: signUpStrategy);
  }
}
