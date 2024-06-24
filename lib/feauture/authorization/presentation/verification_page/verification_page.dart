import 'package:doeves_app/core/presentation/app_bars/title_app_bar.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/buttons/app_elevated_button.dart';
import 'package:doeves_app/core/presentation/buttons/app_filled_button.dart';
import 'package:doeves_app/feauture/authorization/presentation/verification_page/verification_page_vm.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({
    super.key,
    required this.vm,
  });
  final VerificationPageViewModel vm;

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  VerificationPageViewModel get vm => widget.vm;

  void _changeFocusScope({required String value, required int index}) {
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    } else if (value.length == 1 && index < vm.codeControllers.length - 1) {
      FocusScope.of(context).nextFocus();
    }
  }

  Widget get rowCodeFields {
    final codeFieldList = List.generate(
      vm.codeControllers.length,
      (index) => Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          child: TextField(
            style: AppTextTheme.textSm(weight: TextWeight.medium),
            controller: vm.codeControllers[index],
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLength: 1,
            textAlign: TextAlign.center,
            onChanged: (String value) {
              _changeFocusScope(value: value, index: index);
            },
            decoration: const InputDecoration(
              counterText: '',
            ),
          ),
        ),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: codeFieldList,
    );
  }

  Widget get _titleBuilder => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: Text(
              'A confirmation code was sent to',
              style: AppTextTheme.text2Xl(weight: TextWeight.medium),
            ),
          ),
          vm.email.observer(
            (context, value) => Text(
              value,
              style: AppTextTheme.textXl(weight: TextWeight.regular)
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      );

  Widget get _sendCodeButtonsBuilder => Column(
        children: [
          const SizedBox(height: 50),
          vm.codeIsValid.observer(
            (context, value) => AppFilledButton(
              onPressed:
                  value ? () async => vm.sendCodeByVerification(context) : null,
              child: const Text('Send'),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Didn\'t receive the code?',
            style: AppTextTheme.textBase(weight: TextWeight.medium),
          ),
          const SizedBox(height: 20),
          AppElevatedButton(
            child: const Text('Resend the code'),
            onPressed: () async => vm.sendCodeByEmail(context),
          ),
        ],
      );

  @override
  void initState() {
    vm.init(context);
    super.initState();
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
        context: context,
      ),
      body: AppWrapper(
        maxWidth: 500,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleBuilder,
                  const SizedBox(height: 20),
                  Center(
                    child: rowCodeFields,
                  ),
                  _sendCodeButtonsBuilder,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
