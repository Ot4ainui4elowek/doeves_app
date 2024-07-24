import 'package:flutter/material.dart';

class AppLogoAnimated extends StatefulWidget {
  const AppLogoAnimated(
      {super.key,
      this.width,
      this.color,
      this.curve = Curves.easeInOut,
      required this.repeat});
  final double? width;
  final Color? color;
  final Curve curve;
  final bool repeat;

  @override
  State<AppLogoAnimated> createState() => _AppLogoAnimatedState();
}

class _AppLogoAnimatedState extends State<AppLogoAnimated>
    with SingleTickerProviderStateMixin {
  final logoBackground = const AssetImage('assets/images/logo_bg.png');

  final logoArrows = const AssetImage('assets/images/logo_arrows.png');

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: widget.repeat ? (_controller..repeat()) : (_controller..forward()),
    curve: widget.curve,
  );

  double _getAppSizeFigmaAdapter(
      {required double width, required double figmaWidgetWidth}) {
    return figmaWidgetWidth / 98 * (width > 395 ? 395 : width);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _arrowsImageBuilder(BuildContext context) => Positioned(
        top: 0,
        left: _getAppSizeFigmaAdapter(
          width: widget.width ?? 140,
          figmaWidgetWidth: 17,
        ),
        child: RotationTransition(
          turns: _animation,
          child: Image(
            width: _getAppSizeFigmaAdapter(
              width: widget.width ?? 140,
              figmaWidgetWidth: 22,
            ),
            image: logoArrows,
            color: widget.color ?? Theme.of(context).colorScheme.primary,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 395),
      child: Stack(
        children: [
          Image(
            width: widget.width ?? 140,
            image: logoBackground,
            color: widget.color ?? Theme.of(context).colorScheme.primary,
          ),
          _arrowsImageBuilder(context),
        ],
      ),
    );
  }
}
