import 'package:doeves_app/core/domain/container/app_container.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class NetworkConnectionWidget extends StatelessWidget {
  final networkIsConnected = AppContainer().serviceScope.networkService;

  NetworkConnectionWidget({super.key});

  Widget _connectionWidgetBuilder(
          {required BuildContext context, required bool isConnected}) =>
      Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          color: isConnected
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.errorContainer,
        ),
        width: double.maxFinite,
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            isConnected ? 'Internet connected' : 'No internet connection',
            style: AppTextTheme.textSm(weight: TextWeight.medium).copyWith(
              color: isConnected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.error,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return networkIsConnected.networkIsConnected.observer(
      (context, value) =>
          _connectionWidgetBuilder(context: context, isConnected: value),
    );
  }
}
