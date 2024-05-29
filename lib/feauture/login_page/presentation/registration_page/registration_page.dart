import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/buttons/app_filled_button.dart';
import 'package:doeves_app/core/presentation/text_fields/app_text_field.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/password_text_editing_controller.dart';
import 'package:doeves_app/core/presentation/text_fields/password_text_field.dart';
import 'package:doeves_app/feauture/login_page/presentation/registration_page/registration_page_vm.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key, required this.vm});
  final RegistrationPageViewModel vm;

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  RegistrationPageViewModel get vm => widget.vm;

  @override
  void initState() {
    vm.init();
    super.initState();
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  PreferredSizeWidget get appBarBuilder => AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: context.canPop()
            ? TextButton(
                onPressed: context.pop,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 15,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      'Back to Login',
                      style: AppTextTheme.textBase(weight: TextWeight.medium)
                          .copyWith(
                              color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              )
            : null,
      );

  Widget _passwordTextFieldBuilder(
      {required BuildContext context,
      required PasswordTextEditingController controller,
      String title = 'Password'}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextTheme.textBase(weight: TextWeight.medium),
        ),
        const SizedBox(height: 12),
        PasswordTextField(
          controller: controller,
          hintText: '********',
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _authorizationButtonsBuilder(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        vm.registrationFormIsValid.observer(
          (context, value) => AppFilledButton(
            onPressed: value ? () {} : null,
            child: Text(
              'Register',
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
                  context.go(AppRoutes.goToLoginPage);
                },
                child: const Text(
                  'Already have an account? Login here',
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _textFieldWitchTitleBuilder(
      {required String title, required AppTextField textField}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextTheme.textBase(
            weight: TextWeight.medium,
          ),
        ),
        const SizedBox(height: 12),
        textField,
        const SizedBox(height: 32),
      ],
    );
  }

  Widget get registrationFormTextFieldsBuilder => Column(
        children: [
          _textFieldWitchTitleBuilder(
            title: 'Full Name',
            textField: AppTextField(
              controller: vm.fullNameTextController,
              hintText: 'Example: John Doe',
              keyboardType: TextInputType.name,
            ),
          ),
          _textFieldWitchTitleBuilder(
            title: 'Email Adress',
            textField: AppTextField(
              controller: vm.emailTextController,
              hintText: 'Example: johndoe@gmai.com',
            ),
          ),
          _passwordTextFieldBuilder(
            context: context,
            controller: vm.passwordTextController,
          ),
          _passwordTextFieldBuilder(
            context: context,
            controller: vm.retypePasswordTextController,
            title: 'Retype Password',
          ),
        ],
      );

  Widget get _titleBuilder => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Register',
            style: AppTextTheme.text2Xl(weight: TextWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            'And start taking notes',
            style: AppTextTheme.textBase(weight: TextWeight.regular)
                .copyWith(color: Theme.of(context).colorScheme.outline),
          ),
          const SizedBox(height: 32),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBuilder,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: AppWrapper(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleBuilder,
                  registrationFormTextFieldsBuilder,
                  _authorizationButtonsBuilder(context),
                ],
              ),
            ),
          ),
        ));
  }
}
