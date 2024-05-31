import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:doeves_app/feauture/login_page/data/repository/authorization_remote_repository.dart';
import 'package:doeves_app/feauture/login_page/data/source/authorization_client_data_source.dart';
import 'package:doeves_app/feauture/login_page/domain/bloc/theme_bloc.dart';
import 'package:doeves_app/feauture/login_page/domain/repository/authorization_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

class AppContainer {
  late final ServiceScope serviceScope;
  late final RepositoryScope repositoryScope;
  late final String? _restApiUrl;

  AppContainer.init() {
    ready = initDependencies();
    GetIt.instance.registerSingleton(this);
  }

  factory AppContainer() => GetIt.instance<AppContainer>();

  late final Future<bool> ready;

  Future<bool> initDependencies() async {
    _restApiUrl = dotenv.env['APi_ADRESS'];
    try {
      final themeService = ThemeBloc();

      serviceScope = ServiceScope(
        themeService: themeService,
      );
      repositoryScope = RepositoryScope(
          authorizationRepository: AuthorizationRemoteRepository(
        authorizationDataSourse:
            AuthorizationClientDataSource(Dio(), baseUrl: _restApiUrl ?? ''),
      ));
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
  final AuthorizationRepository authorizationRepository;
  const RepositoryScope({required this.authorizationRepository});
}
