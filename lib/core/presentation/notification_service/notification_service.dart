import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/notification_service/snack_bar_notification_service/snack_bar_theme.dart';
import 'package:flutter/material.dart';

abstract class NotificationService {
  Future<void> responseNotification({
    required UseCaseResult response,
    required BuildContext context,
    required String goodUseCaseMessage,
  });
  void showNotification(
      {required BuildContext context,
      required String message,
      required SnackBarThemeImpl theme,
      String buttonActionText = 'ok'});
}
