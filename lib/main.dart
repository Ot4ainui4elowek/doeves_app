import 'package:doeves_app/core/domain/container/app_container.dart';
import 'package:doeves_app/feauture/doeves_app/presentation/doeves_app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(DoevesApp(
    appContainer: AppContainer.init(),
  ));
}
