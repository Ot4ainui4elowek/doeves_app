import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/notification_service/notification_service.dart';
import 'package:doeves_app/core/presentation/notification_service/snack_bar_notification_service/snack_bar_theme.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class SnackBarNotificationServiceImpl implements NotificationService {
  @override
  Future<void> responseNotification({
    required UseCaseResult response,
    required BuildContext context,
    required String goodUseCaseMessage,
  }) async {
    switch (response) {
      case GoodUseCaseResult():
        {
          showNotification(
              context: context,
              message: goodUseCaseMessage,
              theme: SnackBarThemeImpl.seccess());
        }
      case BadUseCaseResult(:final errorData, :final errorList):
        {
          if (errorData != null) {
            showNotification(
                context: context,
                message: errorData.message,
                theme: SnackBarThemeImpl.error());
          } else {
            showNotification(
                context: context,
                message: errorList.first.code,
                theme: SnackBarThemeImpl.error());
          }
        }
    }
  }

  @override
  void showNotification(
      {required BuildContext context,
      required String message,
      required SnackBarThemeImpl theme,
      String buttonActionText = 'ok'}) {
    if (ScaffoldMessenger.of(context).mounted) {
      ScaffoldMessenger.of(context).clearSnackBars();
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextTheme.textBase(weight: TextWeight.medium)
              .copyWith(color: theme.textColor),
        ),
        backgroundColor: theme.backgroundColor,
        action: SnackBarAction(
          textColor: theme.textColor,
          label: buttonActionText,
          onPressed: ScaffoldMessenger.of(context).hideCurrentSnackBar,
        ),
      ),
    );
  }
}
