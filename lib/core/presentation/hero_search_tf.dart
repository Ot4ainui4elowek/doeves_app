import 'package:flutter/material.dart';

class HeroSearch extends StatefulWidget {
  HeroSearch({super.key, this.onTap, this.focusNode});
  void Function()? onTap;
  final FocusNode? focusNode;

  @override
  State<HeroSearch> createState() => _HeroSearchState();
}

class _HeroSearchState extends State<HeroSearch> {
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'hero-search',
        child: Material(
          type: MaterialType.transparency,
          child: TextField(
            focusNode: widget.focusNode,
            autocorrect: true,
            onTap: widget.onTap,
          ),
        ));
  }
}
