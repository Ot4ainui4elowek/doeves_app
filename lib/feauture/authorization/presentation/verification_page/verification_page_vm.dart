import 'package:doeves_app/core/data/secure_storage/secure_storage.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/notification_service/notification_service.dart';
import 'package:doeves_app/core/presentation/notification_service/snack_bar_notification_service/snack_bar_notification_service_impl.dart';
import 'package:doeves_app/core/presentation/notification_service/snack_bar_notification_service/snack_bar_theme.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/feauture/authorization/domain/repository/verification_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:reactive_variables/reactive_variables.dart';

class VerificationPageViewModel {
  VerificationPageViewModel({
    required VerificationRepository verificationRepository,
    required SecureStorage secureStorage,
  })  : _verificationRepository = verificationRepository,
        _storage = secureStorage;

  final SecureStorage _storage;

  final NotificationService _notificationService =
      SnackBarNotificationServiceImpl();

  final VerificationRepository _verificationRepository;

  final List<AppTextEditingController> codeControllers = [
    AppTextEditingController(),
    AppTextEditingController(),
    AppTextEditingController(),
    AppTextEditingController(),
    AppTextEditingController(),
    AppTextEditingController(),
  ];

  final codeIsValid = false.rv;

  final email = ''.rv;

  void init(BuildContext context) async {
    email(await _storage.readEmail());
    if (context.mounted) {
      sendCodeByEmail(context);
    }
    for (var textController in codeControllers) {
      textController.addListener(checkCodeIsValid);
    }
  }

  void dispose() {
    for (var textController in codeControllers) {
      textController.removeListener(checkCodeIsValid);
    }
  }

  final canResendCode = true.rv;

  void checkCodeIsValid() {
    codeIsValid(codeControllers
        .every((textController) => textController.text.isNotEmpty));
  }

  Future<void> sendCodeByVerification(BuildContext context) async {
    final String? token = await _storage.readToken();
    if (token == null) {
      if (context.mounted) {
        _notificationService.showNotification(
            context: context,
            message: 'User is not authorized',
            theme: SnackBarThemeImpl.error());
      }
      return;
    }

    final response = await _verificationRepository.sendVerificationCode(
        code: int.parse(
            codeControllers.map((controller) => controller.text).join('')),
        jwtToken: token);
    if (response is GoodUseCaseResult) {
      _storage.deleteAllSecure();
    }
    if (context.mounted) {
      _notificationService.responseNotification(
          response: response,
          context: context,
          goodUseCaseMessage: 'Your email has been successfully confirmed!');
    }
  }

  Future<void> sendCodeByEmail(BuildContext context) async {
    final String? token = await _storage.readToken();
    if (token == null) {
      if (context.mounted) {
        _notificationService.showNotification(
            context: context,
            message: 'User is not authorized',
            theme: SnackBarThemeImpl.error());
      }
      return;
    }

    final response =
        await _verificationRepository.resendVerificationCode(token);

    canResendCode(false);
    Future.delayed(
      const Duration(seconds: 60),
      () => canResendCode(true),
    );
    if (context.mounted) {
      _notificationService.responseNotification(
          response: response,
          context: context,
          goodUseCaseMessage: 'Code send to your email successfully!');
    }
  }
}
