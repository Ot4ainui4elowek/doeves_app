import 'dart:core';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:doeves_app/core/data/model/jwt_payload_model.dart';
import 'package:doeves_app/core/data/secure_storage/secure_storage.dart';
import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/notification_service/notification_service.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/password_text_editing_controller.dart';
import 'package:doeves_app/feauture/authorization/data/model/sign_in_response_model.dart';
import 'package:doeves_app/feauture/authorization/domain/authorization_strategy/strategy.dart';
import 'package:doeves_app/feauture/authorization/domain/repository/authorization_repository.dart';
import 'package:doeves_app/util/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_variables/reactive_variables.dart';

class LoginPageViewModel {
  LoginPageViewModel({
    required AuthorizationRepository authorizationRepository,
    required NotificationService notificationService,
    required SecureStorage storage,
  })  : _notificationService = notificationService,
        _authorizationRepository = authorizationRepository,
        _storage = storage;
  final emailTextController = AppTextEditingController();
  final passwordTextController = PasswordTextEditingController();
  final authorizationIsValid = false.rv;
  final AuthorizationRepository _authorizationRepository;
  final SecureStorage _storage;
  final NotificationService _notificationService;
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
    context.go(AppRoutes.notesHomePage);
  }

  void goToVerificationPage(
      {required BuildContext context, required String email}) {
    context.goNamed(AppRoutes.verificationPage, extra: email);
  }

  Future<void> signIn(
      {required SignInStrategy signInStrtegy,
      required BuildContext context}) async {
    final result = await signInStrtegy();

    switch (result) {
      case GoodUseCaseResult<SignInResponseModel>(:final data):
        {
          await _storage.writeToken(token: data.token);
          await _storage.writeEmail(email: data.userDTO.email);

          final JwtPayloadModel payload =
              JwtPayloadModel.fromJson(JWT.decode(data.token).payload);
          if (context.mounted) {
            if (payload.isVerified) {
              goToNotesHomePage(context);
            } else {
              goToVerificationPage(context: context, email: data.userDTO.email);
            }
          }
          break;
        }
      default:
        {
          if (context.mounted) {
            _notificationService.responseNotification(
              context: context,
              goodUseCaseMessage: 'Login successful',
              response: result,
            );
          }
        }
    }
  }

  Future<void> signInWithEmail(BuildContext context) async {
    final stretegy = SignInUsingEmailStrategy(
        authorizationRepository: _authorizationRepository,
        password: passwordTextController.text.trim(),
        email: emailTextController.text.trim());
    return await signIn(signInStrtegy: stretegy, context: context);
  }
}
