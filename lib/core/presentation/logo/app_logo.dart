import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width, this.color});
  final logo = const AssetImage('assets/images/logo.png');
  final double? width;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Image(
      width: width ?? 140,
      image: logo,
      color: color ?? Theme.of(context).colorScheme.primary,
    );
  }
}
