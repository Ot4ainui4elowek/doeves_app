import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:doeves_app/core/data/model/jwt_payload_model.dart';
import 'package:doeves_app/core/data/secure_storage/secure_storage.dart';
import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreenViewModel {
  final SecureStorage _secureStorage;
  SplashScreenViewModel({required secureStorage})
      : _secureStorage = secureStorage;
  void initDependencies(BuildContext context) async {
    final token = await _secureStorage.readToken();
    if (token != null) {
      final JwtPayloadModel payload =
          JwtPayloadModel.fromJson(JWT.decode(token).payload);
      if (payload.isVerified && context.mounted) {
        _goToHomePage(context);
      } else if (context.mounted) {
        _goToVerificationPage(context);
      }
    } else if (context.mounted) {
      _goToLoginPage(context);
    }
  }

  Future<void> _goToLoginPage(BuildContext context) => Future.delayed(
      const Duration(seconds: 2), () => context.go(AppRoutes.loginPage));
  Future<void> _goToHomePage(BuildContext context) => Future.delayed(
      const Duration(seconds: 2), () => context.go(AppRoutes.notesHomePage));
  Future<void> _goToVerificationPage(BuildContext context) => Future.delayed(
      const Duration(seconds: 2),
      () => context.go(AppRoutes.goToVerificationPage));
}
