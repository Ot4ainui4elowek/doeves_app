import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/presentation/app_bars/title_app_bar.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  Widget _quitButtonBuilder(BuildContext context) {
    final textTheme = AppTextTheme.textBase(weight: TextWeight.medium);
    return context.canPop()
        ? ElevatedButton(
            child: Text(
              'Back to previous page',
              style: textTheme,
            ),
            onPressed: () => context.pop(),
          )
        : ElevatedButton(
            child: Text(
              'Home',
              style: textTheme,
            ),
            onPressed: () => context.go(AppRoutes.splashScreen),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
        context: context,
        titleText: 'Page error',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Page not found.',
              style: AppTextTheme.textXl(weight: TextWeight.regular),
            ),
            const SizedBox(height: 12),
            _quitButtonBuilder(context),
          ],
        ),
      ),
    );
  }
}
