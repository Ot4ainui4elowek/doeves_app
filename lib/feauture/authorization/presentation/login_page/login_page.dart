import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/buttons/app_filled_button.dart';
import 'package:doeves_app/core/presentation/logo/app_logo_animated.dart';
import 'package:doeves_app/core/presentation/text_fields/app_text_field.dart';
import 'package:doeves_app/core/presentation/text_fields/password_text_field.dart';
import 'package:doeves_app/feauture/authorization/presentation/login_page/login_page_vm.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.vm});
  final LoginPageViewModel vm;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginPageViewModel get vm => widget.vm;

  @override
  void initState() {
    vm.init();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    vm.init();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  Widget _titleBuilder(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          Text(
            'Let’s Login To',
            style: AppTextTheme.text2Xl(weight: TextWeight.bold),
          ),
          const SizedBox(height: 5),
          const AppLogoAnimated(
            curve: Curves.linear,
            repeat: false,
            width: 170,
          ),
          const SizedBox(height: 16),
          Text(
            'And notes your idea',
            style: AppTextTheme.textBase(
                weight: TextWeight.regular,
                color: Theme.of(context).colorScheme.outline),
          ),
          const SizedBox(height: 32),
        ],
      );

  Widget _emailTextFieldBuilder(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email Address',
          style: AppTextTheme.textBase(
            weight: TextWeight.medium,
          ),
        ),
        const SizedBox(height: 12),
        AppTextField(
          controller: vm.emailTextController,
          hintText: 'Example: johndoe@gmail.com',
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _passwordTextFieldBuilder(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: AppTextTheme.textBase(weight: TextWeight.medium),
        ),
        const SizedBox(height: 12),
        PasswordTextField(
          controller: vm.passwordTextController,
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
      ],
    );
  }

  Widget _authorizationButtonsBuilder(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        vm.authorizationIsValid.observer(
          (context, value) => AppFilledButton(
            onPressed: value ? () async => vm.signInWithEmail(context) : null,
            child: Text(
              'Login',
              style: AppTextTheme.textBase(weight: TextWeight.medium),
            ),
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
                    color: Theme.of(context).colorScheme.outline),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  context.push(AppRoutes.registrationPage);
                },
                child: const Text(
                  'Don’t have any account? Register here',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppWrapper(
          maxWidth: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleBuilder(context),
              _emailTextFieldBuilder(context),
              _passwordTextFieldBuilder(context),
              _authorizationButtonsBuilder(context),
            ],
          ),
        ),
      ),
    ));
  }
}
