import 'dart:async';

import 'package:flutter/material.dart';

class AppElevatedbuttonMini extends StatefulWidget {
  final Widget? child;
  final FutureOr<void> Function()? onPressed;
  final void Function()? onLongPress;

  final double? width;
  final double? elevation;
  final Color? progressIndicatorColor;
  final ButtonStyle? style;

  const AppElevatedbuttonMini({
    super.key,
    this.onPressed,
    this.child,
    this.width,
    this.elevation,
    this.progressIndicatorColor,
    this.style,
    this.onLongPress,
  });

  @override
  State<AppElevatedbuttonMini> createState() => _AppElevatedbuttonMiniState();
}

class _AppElevatedbuttonMiniState extends State<AppElevatedbuttonMini> {
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

  final double _verticalPadding = 10;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _buttonGlobalKey,
      height: _buttonHeight,
      width: _buttonWidth,
      child: ElevatedButton(
        onLongPress: widget.onLongPress,
        style: widget.style ??
            ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.surfaceContainer),
            ),
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
