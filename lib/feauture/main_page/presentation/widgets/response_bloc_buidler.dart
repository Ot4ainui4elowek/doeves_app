import 'dart:math';

import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/presentation/logo/app_logo_animated.dart';
import 'package:doeves_app/feauture/main_page/domain/response_bloc/response_bloc.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResponseBlocBuidler extends StatelessWidget {
  const ResponseBlocBuidler({
    super.key,
    required this.bloc,
    this.emptyResponseWidget,
    this.emptyListWidget,
    required this.emptyResponseText,
    required this.epmtyListText,
  });

  final ResponseBloc bloc;
  final Widget? emptyResponseWidget;
  final Widget? emptyListWidget;
  final String emptyResponseText;
  final String epmtyListText;

  Widget _emptyResponseBuilder() => Column(
        children: [
          emptyResponseWidget ?? const SizedBox(height: 0),
          Text(
            emptyResponseText,
            style: AppTextTheme.textXl(weight: TextWeight.medium),
          ),
        ],
      );

  Widget _loadingBuilder(BuildContext context) => AppLogoAnimated(
        repeat: true,
        width: min(MediaQuery.of(context).size.width, 200),
      );

  Widget _initialBuilder(BuildContext context) => Column(
        children: [
          emptyListWidget ?? const SizedBox(height: 0),
          Text(
            epmtyListText,
            style: AppTextTheme.textXl(weight: TextWeight.medium),
          ),
        ],
      );

  Widget _errorBuilder(
          {required BuildContext context, required AppError error}) =>
      Column(
        children: [
          Icon(
            Icons.error_outline,
            color: Theme.of(context).colorScheme.error,
            size: 50,
          ),
          const SizedBox(height: 10),
          Text(
            error.code,
            textAlign: TextAlign.center,
            style: AppTextTheme.textXl(weight: TextWeight.medium)
                .copyWith(color: Theme.of(context).colorScheme.error),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            return bloc.state.maybeWhen(
              orElse: () => const SizedBox(height: 0),
              emptyResponse: _emptyResponseBuilder,
              loading: () => _loadingBuilder(context),
              initial: () => _initialBuilder(context),
              error: (error) => _errorBuilder(context: context, error: error),
            );
          },
        ),
      ),
    );
  }
}
