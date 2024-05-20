import 'package:doeves_app/feauture/splash_screen/presentation/splash_screen_vm.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.vm});
  final SplashScreenViewModel vm;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final logo = const AssetImage('assets/images/logo.png');
  SplashScreenViewModel get vm => widget.vm;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true, min: 0.2);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  );

  @override
  void initState() {
    super.initState();
    vm.goToLoginPage(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image(
            image: logo,
            width: 175,
          ),
        ),
      ),
    );
  }
}
