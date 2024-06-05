import 'package:doeves_app/core/presentation/notification_service/notification_service.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/password_text_editing_controller.dart';
import 'package:doeves_app/feauture/authorization/domain/authorization_strategy/strategy.dart';
import 'package:doeves_app/feauture/authorization/domain/repository/authorization_repository.dart';
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
  final NotificationService _notificationService;

  final emailFocusNode = FocusNode();
  RegistrationPageViewModel({
    required AuthorizationRepository authorizationRepository,
    required NotificationService notificationService,
  })  : _notificationService = notificationService,
        _authorizationRepository = authorizationRepository;
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

  Future<void> signUp(
      {required SignUpStrategy strategy, required BuildContext context}) async {
    final signUpResponse = await strategy();
    if (context.mounted) {
      _notificationService.responseNotification(
          response: signUpResponse,
          context: context,
          goodUseCaseMessage: 'the user was created successfully');
    }
  }

  Future<void> signUpWitchEmailStrategy(BuildContext context) async {
    final signUpStrategy = SignUpUsingEmailStrategy(
      _authorizationRepository,
      fullName: fullNameTextController.text,
      email: emailTextController.text,
      password: passwordTextController.text,
      retypePassword: retypePasswordTextController.text,
    );
    return await signUp(strategy: signUpStrategy, context: context);
  }
}
