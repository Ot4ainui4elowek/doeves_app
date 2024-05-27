import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/password_text_editing_controller.dart';
import 'package:doeves_app/feauture/login_page/domain/entity/authorization_credentrials.dart';
import 'package:doeves_app/feauture/login_page/domain/repository/authorization_repository.dart';
import 'package:doeves_app/util/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_variables/reactive_variables.dart';

class LoginPageViewModel {
  LoginPageViewModel({
    required AuthorizationRepository authorizationRepository,
  }) : _authorizationRepository = authorizationRepository;
  final emailTextController = AppTextEditingController();
  final passwordTextController = PasswordTextEditingController();
  final authorizationIsValid = false.rv;
  final AuthorizationRepository _authorizationRepository;
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

  void goToNotesHomePage(BuildContext context) {
    context.go(AppRoutes.goToNotesHomePage);
  }

  Future<void> signInAccount(BuildContext context) async {
    final result = await _authorizationRepository.signIn(
        email: emailTextController.text, password: passwordTextController.text);
    switch (result) {
      case GoodUseCaseResult<AuthorizationCredentials>(:final data):
        debugPrint(data.jwtToken);
        if (!context.mounted) return;
        goToNotesHomePage(context);
        break;
      case BadUseCaseResult<AuthorizationCredentials>(:final errorList):
        for (final error in errorList) {
          debugPrint(error.code);
        }
        break;
    }
  }
}
