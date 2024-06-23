import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/buttons/back_button.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.errorMessage,
    this.onPressedBackButton,
  });
  final String errorMessage;
  final void Function()? onPressedBackButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 82,
        centerTitle: true,
        title: Text(
          'Error',
          style: AppTextTheme.textBase(weight: TextWeight.medium)
              .copyWith(color: Theme.of(context).colorScheme.error),
        ),
        leading: CustomBackButton(
          onPressed:
              onPressedBackButton ?? () => context.go(AppRoutes.splashScreen),
        ),
      ),
      body: AppWrapper(
        maxWidth: 500,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 150),
                Text(
                  errorMessage,
                  style: AppTextTheme.text2Xl(weight: TextWeight.medium),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
