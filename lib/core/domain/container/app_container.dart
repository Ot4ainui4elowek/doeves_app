import 'dart:developer';

import 'package:doeves_app/feauture/login_page/presentation/bloc/theme_bloc.dart';
import 'package:get_it/get_it.dart';

class AppContainer {
  late final ServiceScope serviceScope;
  late final RepositoryScope repositoryScope;

  AppContainer.init() {
    ready = initDependencies();
    GetIt.instance.registerSingleton(this);
  }

  factory AppContainer() => GetIt.instance<AppContainer>();

  late final Future<bool> ready;

  Future<bool> initDependencies() async {
    try {
      final themeService = ThemeBloc();

      serviceScope = ServiceScope(
        themeService: themeService,
      );
      log('App Container is initialized');
      return true;
    } catch (e, st) {
      log('App Container has not been initialized', error: e, stackTrace: st);
      return false;
    }
  }
}

class ServiceScope {
  final ThemeBloc themeService;
  const ServiceScope({
    required this.themeService,
  });
}

class RepositoryScope {
  const RepositoryScope();
}
