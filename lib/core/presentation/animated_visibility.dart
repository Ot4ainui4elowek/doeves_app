import 'package:flutter/material.dart';

class AnimatedVisibility extends StatefulWidget {
  final bool visible;
  final Widget child;
  final Curve curve;
  final Duration duration;
  final alwaysIncludeSemantics;

  const AnimatedVisibility(
      {super.key,
      this.visible = true,
      required this.child,
      this.curve = Curves.linear,
      this.duration = const Duration(milliseconds: 300),
      this.alwaysIncludeSemantics = false});

  @override
  _AnimatedVisibility createState() => _AnimatedVisibility();
}

class _AnimatedVisibility extends State<AnimatedVisibility> {
  bool isNotBuild = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.visible ? 1 : 0,
      duration: widget.duration,
      curve: widget.curve,
      alwaysIncludeSemantics: widget.alwaysIncludeSemantics,
      onEnd: () {
        if (!isNotBuild) return;

        setState(() {
          isNotBuild = false;
        });
      },
      child: FutureBuilder(
        future: Future.delayed(isNotBuild ? Duration.zero : widget.duration),
        builder: (_, snapshot) => Visibility(
            visible: snapshot.connectionState != ConnectionState.done ||
                widget.visible,
            child: widget.child),
      ),
    );
  }
}
