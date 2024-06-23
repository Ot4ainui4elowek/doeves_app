import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/buttons/back_button.dart';
import 'package:doeves_app/feauture/operation_status_page/domain/entity/data_for_the_status_page.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OperationStatusPage extends StatelessWidget {
  const OperationStatusPage({
    super.key,
    required this.data,
  });
  final DataForTheStatusPage data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 82,
        leading: CustomBackButton(
          onPressed: context.canPop() ? context.pop : data.leadingOnPressed,
        ),
      ),
      body: AppWrapper(
        maxWidth: 500,
        child: Scaffold(
          body: Center(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 150),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        border: Border.all(
                          width: 5,
                          color: data.result is BadUseCaseResult
                              ? Theme.of(context).colorScheme.error
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      child: Icon(
                        color: data.result is BadUseCaseResult
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).colorScheme.primary,
                        data.result is BadUseCaseResult
                            ? Icons.close_rounded
                            : Icons.done_rounded,
                        size: 80,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      data.result is BadUseCaseResult
                          ? (BadUseCaseResult result) {
                              return result.errorList[0].code;
                            }(data.result as BadUseCaseResult)
                          : 'Lalala',
                      style: AppTextTheme.text2Xl(weight: TextWeight.medium),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: data.actions ?? [],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
