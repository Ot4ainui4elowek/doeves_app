import 'package:doeves_app/core/presentation/buttons/app_filled_button.dart';
import 'package:doeves_app/core/presentation/text_fields/app_text_field.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/password_text_editing_controller.dart';
import 'package:doeves_app/core/presentation/text_fields/password_text_field.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          Text(
            'Let’s Login',
            style: AppTextTheme.text2Xl(weight: TextWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            'And notes your idea',
            style: AppTextTheme.textBase(
                weight: TextWeight.regular, color: theme.colorScheme.outline),
          ),
          const SizedBox(height: 32),
          Text(
            'Email Address',
            style: AppTextTheme.textBase(
              weight: TextWeight.medium,
            ),
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: AppTextEditingController(),
            hintText: 'Example: johndoe@gmail.com',
          ),
          const SizedBox(height: 32),
          Text(
            'Password',
            style: AppTextTheme.textBase(weight: TextWeight.medium),
          ),
          const SizedBox(height: 12),
          PasswordTextField(
            controller: PasswordTextEditingController(),
            hintText: '********',
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forgot Password',
              style: AppTextTheme.textBase(
                weight: TextWeight.medium,
              ),
            ),
          ),
          const SizedBox(height: 40),
          AppFilledButton(
            onPressed: () {},
            child: Text(
              'Login',
              style: AppTextTheme.textBase(weight: TextWeight.medium),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Or',
                  style: AppTextTheme.textBase(
                      weight: TextWeight.regular,
                      color: theme.colorScheme.outline),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Don’t have any account? Register here',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
