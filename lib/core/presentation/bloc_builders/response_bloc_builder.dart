import 'dart:math';

import 'package:doeves_app/core/domain/blocs/response_bloc/response_bloc.dart';
import 'package:doeves_app/core/presentation/logo/app_logo_animated.dart';
import 'package:doeves_app/core/presentation/ui/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResponseBlocBuilder extends StatelessWidget {
  const ResponseBlocBuilder(
      {super.key, required this.bloc, required this.child});
  final ResponseBloc bloc;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) => bloc.state.maybeWhen(
        orElse: () => const SizedBox(height: 0),
        initial: () => child,
        loading: () => Center(
          child: AppLogoAnimated(
            curve: Curves.linear,
            repeat: true,
            width: min(double.maxFinite, 200),
          ),
        ),
        error: (message) => Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ErrorMessageWidget(message: message),
          ),
        ),
      ),
    );
  }
}
