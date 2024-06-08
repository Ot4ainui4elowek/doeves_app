import 'dart:developer';

import 'package:doeves_app/core/data/secure_storage/secure_storage.dart';
import 'package:doeves_app/core/presentation/notification_service/notification_service.dart';
import 'package:doeves_app/core/presentation/notification_service/snack_bar_notification_service/snack_bar_notification_service_impl.dart';
import 'package:doeves_app/feauture/authorization/data/repository/authorization_remote_repository.dart';
import 'package:doeves_app/feauture/authorization/data/source/authorization_client_data_source.dart';
import 'package:doeves_app/feauture/authorization/domain/bloc/theme_bloc.dart';
import 'package:doeves_app/feauture/authorization/domain/repository/authorization_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

class AppContainer {
  late final ServiceScope serviceScope;
  late final RepositoryScope repositoryScope;
  late final SecureScope secureScope;

  AppContainer.init() {
    ready = initDependencies();
    GetIt.instance.registerSingleton(this);
  }

  factory AppContainer() => GetIt.instance<AppContainer>();

  late final Future<bool> ready;

  Future<bool> initDependencies() async {
    try {
      final secureStorage = SecureStorage()..deleteAllSecure();
      secureScope = SecureScope(
        secureStorage: secureStorage,
      );
      _initServiceScope();
      _initReposytoryScope();
      log('App Container is initialized');
      return true;
    } catch (e, st) {
      log('App Container has not been initialized', error: e, stackTrace: st);
      return false;
    }
  }

  void _initServiceScope() async {
    try {
      final themeService = ThemeBloc();
      final notificationService = SnackBarNotificationServiceImpl();
      serviceScope = ServiceScope(
        themeService: themeService,
        notificationService: notificationService,
      );
      throw Exception();
    } catch (e, st) {
      log('Services scope has not been initialized', error: e, stackTrace: st);
    }
  }

  void _initReposytoryScope() async {
    try {
      final apiUrl = dotenv.env['APi_ADRESS'];
      final authorizationRepository = AuthorizationRepositoryImpl(
        authorizationDataSourse:
            AuthorizationClientDataSource.create(apiUrl: apiUrl),
      );
      repositoryScope =
          RepositoryScope(authorizationRepository: authorizationRepository);
    } catch (e, st) {
      log('Reposytory scope has not been initialized',
          error: e, stackTrace: st);
    }
  }
}

class SecureScope {
  final SecureStorage secureStorage;
  const SecureScope({required this.secureStorage});
}

class ServiceScope {
  final ThemeBloc themeService;
  final NotificationService notificationService;
  const ServiceScope({
    required this.notificationService,
    required this.themeService,
  });
}

class RepositoryScope {
  final AuthorizationRepository authorizationRepository;
  const RepositoryScope({required this.authorizationRepository});
}
