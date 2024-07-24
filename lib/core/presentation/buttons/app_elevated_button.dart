import 'dart:async';

import 'package:flutter/material.dart';

class AppElevatedButton extends StatefulWidget {
  final Widget? child;
  final FutureOr<void> Function()? onPressed;
  final void Function()? onLongPress;
  final bool mini;

  final double? width;
  final Color? progressIndicatorColor;
  final ButtonStyle? style;

  const AppElevatedButton({
    super.key,
    this.onPressed,
    this.child,
    this.width,
    this.progressIndicatorColor,
    this.style,
    this.onLongPress,
    this.mini = false,
  });

  @override
  State<AppElevatedButton> createState() => _AppElevatedButtonState();
}

class _AppElevatedButtonState extends State<AppElevatedButton> {
  bool _isLoading = false;

  final _buttonGlobalKey = GlobalKey();

  double? _buttonHeight;
  double? _buttonWidth;

  Future<void> _onPressed() async {
    if (_isLoading) return;
    try {
      setState(() => _isLoading = true);

      await widget.onPressed?.call();
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _buttonHeight = _buttonGlobalKey.currentContext?.size?.height;
      _buttonWidth = _buttonGlobalKey.currentContext?.size?.width;
    });
  }

  double get _verticalPadding => widget.mini ? 10 : 18;

  ButtonStyle get _minStyle => ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
            Theme.of(context).colorScheme.surfaceContainer),
      );

  ButtonStyle get _maxStyle => ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      );

  ButtonStyle get _style =>
      widget.style ?? (widget.mini ? _minStyle : _maxStyle);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _buttonGlobalKey,
      height: _buttonHeight,
      width: widget.mini ? _buttonWidth : widget.width ?? double.maxFinite,
      child: ElevatedButton(
        onLongPress: widget.onLongPress,
        style: _style,
        onPressed: widget.onPressed == null ? null : _onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: _verticalPadding),
          child: !_isLoading
              ? widget.child
              : SizedBox(
                  width: _buttonHeight! - _verticalPadding * 2,
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(
                        widget.progressIndicatorColor ??
                            Theme.of(context).colorScheme.onSurface),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                  ),
                ),
        ),
      ),
    );
  }
}
