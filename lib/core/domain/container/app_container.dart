import 'dart:developer';

import 'package:doeves_app/core/data/secure_storage/secure_storage.dart';
import 'package:doeves_app/core/domain/network_info/network_info.dart';
import 'package:doeves_app/core/presentation/notification_service/notification_service.dart';
import 'package:doeves_app/core/presentation/notification_service/snack_bar_notification_service/snack_bar_notification_service_impl.dart';
import 'package:doeves_app/feauture/authorization/data/repository/authorization_remote_repository.dart';
import 'package:doeves_app/feauture/authorization/data/repository/verification_repository_impl.dart';
import 'package:doeves_app/feauture/authorization/data/source/authorization_client_data_source.dart';
import 'package:doeves_app/feauture/authorization/domain/bloc/theme_service.dart';
import 'package:doeves_app/feauture/authorization/domain/repository/authorization_repository.dart';
import 'package:doeves_app/feauture/authorization/domain/repository/verification_repository.dart';
import 'package:doeves_app/feauture/main_page/data/repository/notes_repository_impl.dart';
import 'package:doeves_app/feauture/main_page/data/source/notes_data_source.dart';
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

  Future<void> _initServiceScope() async {
    try {
      log('init service scope');
      final themeService = ThemeService();
      final notificationService = SnackBarNotificationServiceImpl();
      final networkService = NetworkInfoServiceImpl();

      serviceScope = ServiceScope(
        themeService: themeService,
        notificationService: notificationService,
        networkService: networkService,
      );
    } catch (e, st) {
      log('Services scope has not been initialized', error: e, stackTrace: st);
    }
  }

  Future<void> _initReposytoryScope() async {
    try {
      final apiUrl = dotenv.env['APi_ADRESS'];
      final authDataSource =
          AuthorizationClientDataSource.create(apiUrl: apiUrl);
      final notesDataSourse = NotesClientDataSource.create(apiUrl: apiUrl);
      final notesRepository = NotesRepositoryImpl(data: notesDataSourse);
      final authorizationRepository =
          AuthorizationRepositoryImpl(authorizationDataSourse: authDataSource);
      final verificationRepository =
          VerificationRepositoryImpl(dataSourse: authDataSource);
      repositoryScope = RepositoryScope(
        authorizationRepository: authorizationRepository,
        verificationRepository: verificationRepository,
        notesRepository: notesRepository,
      );
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
  final ThemeService themeService;
  final NotificationService notificationService;
  final NetworkInfoServiceImpl networkService;
  const ServiceScope({
    required this.notificationService,
    required this.themeService,
    required this.networkService,
  });
}

class RepositoryScope {
  final AuthorizationRepository authorizationRepository;
  final VerificationRepository verificationRepository;
  final NotesRepositoryImpl notesRepository;
  const RepositoryScope({
    required this.authorizationRepository,
    required this.verificationRepository,
    required this.notesRepository,
  });
}
