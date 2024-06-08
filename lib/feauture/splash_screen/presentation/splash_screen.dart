import 'package:doeves_app/core/presentation/logo/app_logo_animated.dart';
import 'package:doeves_app/feauture/splash_screen/presentation/splash_screen_vm.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.vm});
  final SplashScreenViewModel vm;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenViewModel get vm => widget.vm;

  @override
  void initState() {
    super.initState();
    vm.initDependencies(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppLogoAnimated(
          repeat: true,
          width: MediaQuery.of(context).size.width / 2,
          curve: Curves.linear,
        ),
      ),
    );
  }
}
